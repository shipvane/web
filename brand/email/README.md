# Shipvane waitlist — welcome email

On-brand confirmation email sent to people who join the waitlist at
[shipvane.com](https://shipvane.com). Two versions:

- **`waitlist-welcome.txt`** — plain text. Use this for **Formspree's autoresponse**
  (its autoresponder is text-oriented). Subject line is the first line of the file.
- **`waitlist-welcome.html`** — polished, table-based HTML email (navy/green brand,
  no remote images or JS, renders in Gmail/Apple Mail/Outlook). Use this when the
  waitlist graduates to a real ESP (Buttondown / Resend / Mailchimp).

Voice matches `brand/social/COPY.md`: lead with the brand line
(*Your code, your cloud, your call.*), action line (*Ship your code, just point the way.*).

## Subject line

> You're aboard — welcome to the Shipvane waitlist ⚓

A/B alternate: `You're on the Shipvane waitlist ⚓`

---

## How to turn it on

The form (`site/index.html`) posts `email` to Formspree endpoint `mbdvrvke`.
The autoresponder is enabled in **Formspree's dashboard**, not in code.

### Option A — Formspree autoresponder (simplest; needs a paid plan)

1. Log in to [formspree.io](https://formspree.io) → open the **Shipvane waitlist** form (`mbdvrvke`).
2. **Settings → Autoresponse** → enable.
3. Paste the **subject** and the body from `waitlist-welcome.txt`.
4. Confirm the "from"/reply-to is `hello@shipvane.com` (verify the domain if prompted).
5. Send yourself a test signup from shipvane.com to confirm delivery + that it doesn't land in spam.

> Note: Formspree's autoresponse is a **paid-plan** feature and is text-oriented,
> so use the `.txt` version there. The current form runs on the free tier, so this
> step needs a plan upgrade first.

### Option B — free path, own the emails (Buttondown)

If you'd rather not pay Formspree, [Buttondown](https://buttondown.com) has a free
tier with a **native welcome email** (and double opt-in). Migration is small:

1. Create a Buttondown account + a newsletter; copy its API/form endpoint.
2. In `site/index.html`, change the `<form action="…">` from the Formspree URL to
   Buttondown's, keep the `email` field name (Buttondown expects `email`).
3. Paste `waitlist-welcome.html` as the Buttondown **welcome email**.
4. Re-test the on-page submit (the fetch handler is endpoint-agnostic — it just
   needs a 2xx JSON response).

Either way the email copy above is ready to paste.
