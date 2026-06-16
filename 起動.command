#!/bin/zsh
# Irodori-TTS VoiceDesign ブラウザUI 起動ランチャ
# Finder でこのファイルをダブルクリックすると、ブラウザUIが立ち上がります。
cd "$(dirname "$0")"
export PATH="$HOME/.local/bin:$PATH"

echo "Irodori-TTS (VoiceDesign) を起動します..."
echo "起動後、自動でブラウザが開きます。開かない場合は手動で http://localhost:7861 へアクセスしてください。"
echo "終了するには、このウィンドウで Control + C を押してください。"
echo ""

# UIが立ち上がったタイミングでブラウザを自動で開く（5秒待機）
( sleep 5 && open "http://localhost:7861" ) &

uv run --no-sync python gradio_app_voicedesign.py --server-name 127.0.0.1 --server-port 7861
