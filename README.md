# Discourse SSO

Easy, configurable Discourse SSO: **GET api/auth/login -> recieve a Discourse api key**. Allows using Discourse as your SSO provider to authenticate users into your own websites.

Based on the [official implementation](https://meta.discourse.org/t/using-discourse-as-a-sso-provider/32974), written in ASP.NET Core, but you needn't touch the code, everything is setup using [configuration](#configuration). This means you can use this regardless of your tech stack.

Using this will alow you to share your discourse userbase with your websites!

# Usage

1. [Build](https://docs.microsoft.com/en-us/dotnet/articles/core/deploying/) the project for your target OS (probably ubuntu)
2. Add your [configuration](#configuration) to `appsettings.json`
3. In your Discourse app, go to settings -> login -> and set `enable sso provider` to true, also enter the `sso secret`
4. Thats it! Perform `GET api/auth/login` to get a Discourse api key! (the user will be prompted to log in if not already logged in)

How to use the discourse api key you can see on the [official documentation site](https://docs.discourse.org/) in the Authentication section.

# Configuration

Set the following environment variables:

-   DiscourseUrl `// your discourse site URL`
-   DiscourseSsoSecret `// sso secret you setup in Discourse settings`
-   DiscourseApiKey `// created in the admin panel (${DiscourseUrl}/admin/api/keys)`
-   FrontendUrl `// your SPA application url`

For development mode this variables can be configured using `dotnet user-secrets` command.

Examples of variables values are presented in `.env.example`.
