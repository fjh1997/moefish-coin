#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="$ROOT/dist/catfish-dero"

mkdir -p "$DIST/bin"
cd "$ROOT"

GOOS=windows GOARCH=amd64 go build -o "$DIST/bin/derod.exe" ./cmd/derod
GOOS=windows GOARCH=amd64 go build -o "$DIST/bin/dero-miner.exe" ./cmd/dero-miner
GOOS=windows GOARCH=amd64 go build -o "$DIST/bin/dero-wallet-cli.exe" ./cmd/dero-wallet-cli

# Windows GUI binary; cmd/catfish-desktop/rsrc_windows_amd64.syso embeds the app icon.
GOOS=windows GOARCH=amd64 go build -ldflags="-H=windowsgui" -o "$DIST/CatfishDero.exe" ./cmd/catfish-desktop

# Also ship the logo next to the exe for convenience.
cp -f "$ROOT/cmd/catfish-desktop/public/logo.png" "$DIST/logo.png"
cat > "$DIST/README.txt" <<'EOF'
Catfish Coin Desktop / 猫鱼币桌面客户端

中文说明

Catfish Coin（猫鱼币）是一种新型实验性隐私加密货币客户端。
双击 CatfishDero.exe 启动 Catfish 公网主链客户端。
程序会自动启动节点和钱包；CPU 挖矿只有点击“开始挖矿”后才会启动。
客户端支持中文和英文切换。

数据目录：
  %LOCALAPPDATA%\CatfishDeroPublic

本发布包仅供学习、娱乐、技术研究和评估。
本项目基于 DERO HE，上游源码使用 Research License；商业使用或商业分发前请确认许可证要求。

English

Catfish Coin is an experimental privacy cryptocurrency client.
Double-click CatfishDero.exe to start the Catfish public-chain client.
The app starts the node and wallet automatically. CPU mining starts only after clicking the mining button.
The client supports switching between Chinese and English.

Data directory:
  %LOCALAPPDATA%\CatfishDeroPublic

This package is for learning, entertainment, technical research, and evaluation only.
DERO upstream source uses a Research License; confirm licensing before commercial use or commercial distribution.
EOF

echo "Built: $DIST/CatfishDero.exe"
