# Catfish Coin v0.1.4 / 猫鱼币 v0.1.4

## 中文

本版本修复新钱包注册后挖矿地址仍在成熟期时无法继续出块的问题。

更新内容：

- 如果当前钱包已经注册但矿工地址还在成熟等待期，客户端会临时使用引导地址出块，避免网络停住。
- 钱包矿工地址成熟后，客户端会自动切回当前钱包地址挖矿。
- 矿工状态新增 `引导出块中`，区分“正在帮网络推进区块”和“正在挖到自己的钱包”。
- 钱包状态会显示挖矿地址还需要多少个区块成熟；该成熟度固定按注册 topo + 25 判断，不会再出现先可挖、后不可挖的倒退。
- 保留 v0.1.3 的区块浏览器出块时间显示，以及矿工地址精确验证修复。

使用方式：

1. 下载 `catfish-dero-public-windows.zip`
2. 解压
3. 双击 `CatfishDero.exe`
4. 需要出块时手动点击 `开始挖矿`

注意：

- 本项目仅供学习、娱乐、技术研究和评估。
- 不得用于发行融资、交易撮合、投资理财、洗钱、诈骗、传销、赌博、非法集资、非法挖矿或规避监管。
- 本项目基于 DERO HE，上游 Research License 不授予商业使用或商业分发权利。

## English

This release fixes mining startup when a newly registered wallet is still inside the miner-address maturity window.

Changes:

- If the current wallet is registered but its miner address is still maturing, the client temporarily mines to the bootstrap address so the network can keep producing blocks.
- Once the wallet miner address is mature, the client automatically switches mining rewards back to the current wallet address.
- The miner status now shows `Bootstrap mining` for this temporary state.
- The wallet status now shows how many blocks remain before the miner address is mature. Maturity is always calculated as registration topo + 25, so the client no longer flips from ready back to not-ready as the chain grows.
- This keeps the v0.1.3 block-time explorer display and exact miner-address validation fix.

Usage:

1. Download `catfish-dero-public-windows.zip`
2. Extract it
3. Double-click `CatfishDero.exe`
4. Click `Start Mining` / `开始挖矿` manually when blocks are needed

Notice:

- This project is for learning, entertainment, technical research, and evaluation only.
- Do not use it for issuance financing, exchange matching, investment solicitation, money laundering, fraud, pyramid schemes, gambling, illegal fundraising, illegal mining, or regulatory evasion.
- This project is based on DERO HE. The upstream Research License does not grant commercial use or commercial distribution rights.
