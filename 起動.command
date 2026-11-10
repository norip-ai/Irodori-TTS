#!/bin/zsh
# Irodori-TTS VoiceDesign ブラウザUI 起動ランチャ
# Finder でこのファイルをダブルクリックすると、ブラウザUIが立ち上がります。
cd "$(dirname "$0")"
export PATH="$HOME/.local/bin:$PATH"
# 環境は Drive の外（~/venvs/irodori-tts）。Drive 上の .venv は 2026-11-10 に廃止
export UV_PROJECT_ENVIRONMENT="$HOME/venvs/irodori-tts"
# モデルは ~/.cache/huggingface にある。付けないと更新確認で固まる
export HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1

echo "Irodori-TTS (VoiceDesign) を起動します..."
echo "起動後、自動でブラウザが開きます。開かない場合は手動で http://localhost:7861 へアクセスしてください。"
echo "終了するには、このウィンドウで Control + C を押してください。"
echo ""

# UIが立ち上がったタイミングでブラウザを自動で開く（5秒待機）
( sleep 5 && open "http://localhost:7861" ) &

uv run --no-sync python gradio_app_voicedesign.py --server-name 127.0.0.1 --server-port 7861
