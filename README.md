# Shipvane

**Ship your code, just point the way.**
_Your code, your cloud, your call._

Shipvane runs autonomous coding agents inside **your own cloud** — not a black box.
You point it at a ticket; it works in a real checkout, proves the change against a
**real CI build** (it's not done until the build is green), and lands a merge-ready
PR for **your approval**. Your code never leaves your environment, and nothing
merges without your say.

> 🚧 **Early development.** This repository reserves the `shipvane` name across
> npm, PyPI, and GitHub while the product is built. Docs and the CLI are coming
> soon — https://shipvane.com

## Why Shipvane

Black-box SaaS coding agents run your codebase in someone else's opaque
environment and hand back code they can't truly verify. Shipvane is the opposite:

- **Your cloud, not a black box.** The agent runtime deploys into your own AWS
  account, so you own the environment, the logs, and the keys. (AWS today; more
  to come.)
- **Proven, not just generated.** Every change runs your real build and tests and
  iterates until the gate is green.
- **You hold the final say.** Code only moves forward with your approval — runs
  are ephemeral and scoped per ticket.

## The pieces

- **Shipvane Connect** — the CLI you drive from your terminal. Point it at a
  ticket, watch progress stream back, and approve each step. *(In development.)*
- **Shipvane Engine** — the agentic runtime, packaged to deploy and provision
  into your own cloud. It runs the real checkout, build, and CI loop where your
  code already lives. *(In development.)*

Engine speaks the **Model Context Protocol** and signs in over **OAuth**, so the
Connect CLI is just one way in — you can also drive it straight from the AI
assistant you already use. Working today in **Claude Desktop** and **Claude
mobile**; ChatGPT and other MCP clients coming.

## Where to find it
- **Web:** https://shipvane.com
- **npm:** `npm i shipvane` *(reserved)*
- **PyPI:** `pip install shipvane` *(reserved)*

---

© Shipvane. Name-reservation placeholder — not the licensed product.
