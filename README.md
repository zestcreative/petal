# Petal Template App

Clone this project and rename

```sh
export FROM="petal"
export FROM_MODULE="Petal"
export TO="my_app"
export TO_MODULE="MyApp"

git clone git@github.com:zestcreative/petal.git "$TO"
cd "$TO"
git ls-files -z | xargs -0 perl -p -i -e "s/$FROM/$TO/g; s/$FROM_MODULE/$TO_MODULE/g;"
mv "lib/${FROM}" "lib/$TO"
mv "lib/${FROM}.ex" "lib/${TO}.ex"
mv "lib/${FROM}_web" "lib/${TO}_web"
mv "lib/${FROM}_web.ex" "lib/${TO}_web.ex"
mv "test/${FROM}_web" "test/${TO}_web"
rm -rfv .git
git init .
git add -A
git commit -m "PETAL stack init 🐣🔥"
```

To start your Phoenix server:

  * Setup the project with `mix setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Rename The App

```sh
export FROM="petal"
export FROM_MOD="Petal"
export TO="my_app"
export TO_MOD="MyApp"

cp -R "$FROM" "$TO"
cd "$TO"
git ls-files -z | xargs -0 perl -p -i -e "s/$FROM/$TO/g; s/$FROM_MOD/$TO_MOD/g;"
mv "lib/${FROM}" "lib/$TO"
mv "lib/${FROM}.ex" "lib/${TO}.ex"
mv "lib/${FROM}_web" "lib/${TO}_web"
mv "lib/${FROM}_web.ex" "lib/${TO}_web.ex"
mv "test/${FROM}_web" "test/${TO}_web"
rm -rfv .git
```

## Deploy the App

### Gigalixir

**TODO**

### Heroku

**TODO**

### VPC (Bare server, like Digital Ocean droplets, Linode, or EC2)

**TODO**
