# Deploying socialbankers.org (static site, Kamal on the portal host)

The marketing site is deployed with **Kamal** onto the **same EC2 host as the
portal**. It's a tiny nginx container; the shared **kamal-proxy** on the host
routes by hostname:

```
socialbankers.org          → social-bankers-www container (nginx, this site)
members.socialbankers.org  → social-bankers   container (the portal app)
```

kamal-proxy terminates TLS (Let's Encrypt) for both, so the apex domain gets
HTTPS with a plain A record — no S3/CloudFront/Route 53 needed. (This replaces
the earlier S3 + CloudFront plan.)

## Prerequisites

- The **portal** is deployed first (its `kamal setup` boots the shared
  kamal-proxy on the host). This site then attaches to that same proxy.
- Kamal on your machine (`gem install kamal`), the EC2 host IP, and registry
  credentials (reuse the portal's Docker Hub / ECR creds).

## Deploy

```bash
cp .kamal/secrets.example .kamal/secrets   # fill in registry creds (gitignored)
export SOCIAL_BANKERS_SERVER_IP=1.2.3.4     # same host as the portal

kamal setup     # first time (attaches to the existing kamal-proxy)
kamal deploy    # subsequent content updates
```

To update the site, edit the HTML/assets and run `kamal deploy` again.

## DNS (at Namecheap)

Point the apex at the EC2 host (same IP as `members.socialbankers.org`):

| Type | Host | Value |
|---|---|---|
| A | `@` (socialbankers.org) | the EC2 public IP |
| A | `members` | the EC2 public IP |

`www`: either add `www.socialbankers.org` to `proxy.host` (if your Kamal version
supports multiple hosts) and an `A` record for `www`, or set a Namecheap URL
redirect `www` → `https://socialbankers.org`. The apex is canonical.

## Before launch

- The contact form still posts to a placeholder Formspree endpoint — point it at
  a real endpoint delivering to **info@socialassurance.com** (see `README.md`).

## Files

`index.html`, `about.html`, `membership.html`, `contact.html`, `assets/` — plus
`Dockerfile`, `nginx.conf`, and `config/deploy.yml` for the deploy. If you add a
page, add it to the `COPY` line in the `Dockerfile`.
