# Social Bankers — socialbankers.org

Static marketing site. No CMS, no build step. Four HTML files plus `assets/`.
Edit the HTML directly and upload; what you see in the file is what ships.

| File | Page |
| --- | --- |
| `index.html` | Home |
| `about.html` | About Us |
| `membership.html` | Membership |
| `contact.html` | Contact |

## Before launch: configure the contact form endpoint

`contact.html` posts to a placeholder:

```
action="https://formspree.io/f/REPLACE_WITH_FORM_ID"
```

Create a form on any hosted form service (Formspree, Basin, Getform, Netlify
Forms), set its recipient to **info@socialassurance.com**, and paste the real
endpoint URL into that `action`. Until you do, submitting opens the visitor's
email client addressed to info@socialassurance.com — nothing is lost, but it's
a worse experience, so swap it before launch.

## No events / schedule page (intentional)

We are **not** advertising upcoming meetings or events right now, so there is no
events or schedule page and no "Education & Events" nav item. The homepage's
"How Members Connect" section describes the *kinds* of things members do
(discussions, cohorts, roundtables, networking) as general value — it is not a
calendar. If you ever want to publish an actual schedule again, that's a new
page to add back; don't confuse it with this section.

## Links out to the member portal

The marketing site does not collect applications itself. It links to the portal:

- **Apply for Membership** → `https://members.socialbankers.org/application`
- **Member Login** → `https://members.socialbankers.org`

If either URL changes, search-and-replace across the four HTML files.

## Writing style

- Subheads are Title Case, no period: *Reasons Members Keep Coming Back*
- A subhead that's a complete sentence gets a period: *Community banking has
  always been built on relationships.*

## Brand

Navy `#16243F` · Sage `#6FA3A2` · White. Wordmark is Azo Sans; the site uses
Montserrat as the web fallback.

The logo appears **once in the header, once in the footer, and once as a faint
hero watermark** — deliberately. Don't reintroduce it as a tiled background or
as card icons; card icons should carry their own meaning.
