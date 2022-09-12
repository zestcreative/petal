# Petal

This template is out of date. The earlier hurdles of setting up Tailwind is now made much easier with these official libraries:
- https://github.com/phoenixframework/tailwind
- https://github.com/phoenixframework/esbuild

With the introduction of LiveView.JS, there isn't as much of a need for AlpineJS.

Phoenix LiveView has also progressed a lot since the introduction of this template, such as using HEEX templates and Phoenix.Component, providing much better patterns when spinning up new projects. Therefore, this will be archived.

---

Clone this project and rename

```sh
export FROM="petal"
export FROM_MODULE="Petal"
export TO="my_app"
export TO_MODULE="MyApp"

# Skip these steps if you used GitHub's 'Use this template' feature
git clone git@github.com:zestcreative/petal.git "$TO"
cd "$TO"

# Rename the project
git ls-files -z | xargs -0 perl -p -i -e "s/$FROM/$TO/g; s/$FROM_MODULE/$TO_MODULE/g;"
mv "lib/${FROM}" "lib/$TO"
mv "lib/${FROM}.ex" "lib/${TO}.ex"
mv "lib/${FROM}_web" "lib/${TO}_web"
mv "lib/${FROM}_web.ex" "lib/${TO}_web.ex"
mv "test/${FROM}_web" "test/${TO}_web"

# Skip these steps if you used GitHub's 'Use this template' feature
rm -rfv .git
git init .

# Commit Renaming
git add -A
git commit -m "PETAL stack init 🐣🔥"
```

To start your Phoenix server:

  * Setup the project with `mix setup`
  * Start Phoenix endpoint and IEx console with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
