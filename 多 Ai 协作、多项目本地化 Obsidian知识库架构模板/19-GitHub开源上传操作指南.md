# GitHub 开源上传操作指南

本指南用于把本模板作为“通用框架”发布到 GitHub。发布前必须确认：仓库只包含可公开复用的目录、流程、模板和示例，不包含个人项目资料、对话历史、真实路径、账号凭据或本机配置。

## 一、发布边界

允许上传：

- 通用架构说明、目录模板、流程卡和恢复指南
- 脱敏后的示例、占位符和空目录说明
- `README.md`、许可证和版本记录

禁止上传：

- 文献、康评助手或其他项目的真实文件、对话、知识库内容
- 本机绝对路径、私人姓名、邮箱、服务器地址和内部域名
- API Key、Token、Cookie、密码、证书、私钥和 `.env` 文件
- MCP 私密配置、账号配置、缓存、日志和备份包
- 原始思维补录等个人材料（除非已获得明确授权并完成脱敏）

## 二、发布前检查

在模板目录执行：

```bash
cd "/Users/atom/Downloads/codex/Codex 本体/非必要/多项目知识库架构复制模板"
find . -type f -not -path './.git/*' -print
rg -n --hidden --glob '!.git' \
  '(/Users/|/Volumes/|/home/|[A-Za-z]:\\\\|api[_-]?key|token|secret|password|cookie|private[_-]?key|BEGIN .* PRIVATE KEY|\.env)' .
```

发现真实值或私人资料时，先移出仓库，再继续。不要依赖 `.gitignore` 掩盖已经提交过的敏感信息。

## 三、初始化本地仓库

在 GitHub 网页创建一个新的空仓库，例如 `multi-ai-knowledge-base-template`。不要勾选自动生成 README、许可证或 `.gitignore`，避免首次推送发生冲突。

```bash
cd "/Users/atom/Downloads/codex/Codex 本体/非必要/多项目知识库架构复制模板"
git init
git branch -M main
git add .
git status --short
git diff --cached --stat
git commit -m "Initial release: multi-AI project knowledge base framework"
```

## 四、绑定远端并首次推送

把下面的占位地址替换为你自己的 GitHub 仓库地址：

```bash
git remote add origin https://github.com/<你的用户名>/<仓库名>.git
git remote -v
git push -u origin main
```

如果你使用 SSH：

```bash
git remote add origin git@github.com:<你的用户名>/<仓库名>.git
git push -u origin main
```

## 五、GitHub 仓库设置

建议补充：

1. 选择公开仓库（Public）。
2. 添加 `LICENSE`，模板类项目通常可选 MIT；如需限制商用，先咨询法律意见。
3. 在仓库简介中说明：这是通用框架，不包含个人项目数据。
4. 设置 Topics，例如 `obsidian`、`multi-ai`、`knowledge-management`、`project-governance`。
5. 开启 Issues；是否开启 Discussions 按维护需要决定。
6. 在 About 或 README 中标明当前版本和最后更新日期。

## 六、发布后验收

```bash
git status
git log -1 --oneline
git ls-tree -r --name-only HEAD
git remote -v
```

再用浏览器打开 GitHub 仓库，抽查以下内容：

- README 是否能说明用途、目录结构、使用边界和安全门禁
- 文档中的路径是否都是占位符或相对路径
- 是否误包含项目名称、私人材料、密钥或配置备份
- 新用户能否只按 README 和模板完成初始化

## 七、后续版本发布

每次发布前先更新变更记录，再执行：

```bash
git add .
git diff --cached --stat
git commit -m "docs: update framework templates"
git tag -a v1.0.0 -m "First public release"
git push origin main --tags
```

版本号建议遵循：

- `MAJOR`：架构或兼容方式发生重大变化
- `MINOR`：新增模块、模板或流程
- `PATCH`：文字修正、示例修正和小范围补充

## 八、误上传敏感信息时

立即撤销相关密钥并停止继续推送。仅从当前文件删除并不能清除 Git 历史；需要使用 GitHub 官方建议的历史清理工具彻底移除，并重新检查所有分支、标签和 Fork。涉及凭据时，优先把凭据作废，再处理仓库历史。

## 九、开源仓库与本地项目的关系

GitHub 仓库只保存“可复制的通用框架”。本地 Codex 本体、文献项目、康评助手项目及各自 Obsidian 知识库继续独立保存，不能因为模板开源而互相读取、同步或合并。
