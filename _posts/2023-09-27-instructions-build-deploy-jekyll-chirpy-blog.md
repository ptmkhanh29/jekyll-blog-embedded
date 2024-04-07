---
title: Hướng dẫn Build và Deploy blog Jekyll Chirpy
date: 2023-09-27 13:23:00 +0530
categories: [Welcome, Tutorial]
tags: [introduction, markdown]
img_path: "/assets/img/contribute-to-blog"
image:
  path: "page-cover.png"
  alt: "Contribution Page"
author: khanhphan
pin: true
---

Welcome mọi người đến với [**Blog Khanh Phan**](https://github.com/ptmkhanh29/blog-personal "Goto original Repo") đây là một open-source được mình chôm từ Jekyll. Vì mình cũng là người thích chia sẻ và hay note lại những thứ đã học, mà kiến thức FE của mình thì vỏn vẹn là con số 1 luôn, nên để có thể build được 1 blog app cá nhân với cái trình FE có hạn này là quá khó khăn, do đó mà mình đã dùng Jekyll.

## Đôi điều về Jekyll

> Jekyll là một trình tạo website tĩnh, dựa trên ngôn ngữ lập trình Ruby, được sử dụng phổ biến để xây dựng blog, trang cá nhân và dự án với nội dung không đổi. Nó chuyển đổi text và template thành các trang HTML tĩnh, có thể dễ dàng phục vụ qua bất kỳ máy chủ web nào.

Sự khác biệt giữa Jekyll và các nền tảng như WordPress hoặc Blogger đó là Jekyll không sử dụng cơ sở dữ liệu, mọi nội dung được lưu trong các file tĩnh như Markdown, HTML. Jekyll tập trung vào tốc độ, bảo mật, và dễ dàng version control (do nó push lên git nên dễ dàng track và restore dữ liệu) vì nó dựa vào file tĩnh.

Còn lí do tại sao mình dùng Jekyll mà không dùng WordPress hoặc Blogger thì tại do mình thấy cái template này của Jekyll nó đẹp, mình ưng 😂

Tản mạn xong rồi, trong phần này mình sẽ tập trung description lại những bước cơ bản để build: setting local, run project ở local và deploy lên Netlify. Tất nhiên là bạn cũng có thể deploy lên Github Pages

## Getting Starteds

### Setting up Environment

It's highly suggest to use any Linux distro _(Ubuntu: highly recommended)_ compared to Windows. Most of the cases, you won't face any issues while building the project within your local system if you follow the instruction below properly. But if you're facing any issue, you can post them within the repo discussion [Help Request](https://github.com/Grow-with-Open-Source/Notebook/discussions/3 "Goto Help Request Discussion")...

#### For Ubuntu:

If you're using a Linux distribution - **Ubuntu**, follow these steps:

- Install `Ruby` and other prerequisites:
```bash
sudo apt-get install ruby-full build-essential zlib1g-dev -y
```

> Avoid installing RubyGems packages (called gems) as the root user. Instead, set up a gem installation directory for your user account. The following commands will add environment variables to your `~/.bashrc`{: .file-path} file to configure the gem installation path:
```bash
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
{: .prompt-info}

- Use the following command, to check whether `Ruby` has properly installed and its PATH has been set properly.
```bash
ruby -v
```

- Finally, install Jekyll and Bundler:
```bash
gem install jekyll bundler
```

> For Other Linux Distros, check the offical Jekyll webpage[^other-linux-distros-installation]. Also make sure, you have installed `bundler` along with jekyll using the follow command:
```bash
gem install bundler
```
{: .prompt-tip}

- Use the following command to check whether the `bundler` and jekyll framework installed properly or not.
```bash
bundle info --path jekyll-theme-chirpy
```

#### For Windows:

For Windows users, setting up the environment is a bit more involved:

- Start by downloading and installing the the `Ruby` using [RubyInstaller](https://rubyinstaller.org/downloads/ "Download RubyInstaller"), choose the the latest one with Devkit with default options.

- At the end of installation, You'll get CMD asking you to enter option between 1-3. Enter 3 as input, then you can enter 2 if you want to update `MYSYS2` but that's totally optional. After all the installation is done, press enter to close the CMD prompt.
![prompt-img](cmd-prompt-img.png)

- Use the following command, to check whether `Ruby` has properly installed and its PATH has been set properly.
```powershell
ruby -v
```
![prompt-img](check-ruby-v.png)

- Open a new command prompt window from the start menu and install Jekyll and Bundler:
```powershell
gem install jekyll bundler
```

- Use the following command to check whether the `bundler` and jekyll framework installed properly or not.
```bash
bundle info --path jekyll-theme-chirpy
```

#### For MacOS:

If you're on MacOS, follow these steps:

> Ensure you have the [Homebrew](https://brew.sh/ "Install Homebrew") package manager installed. If you're facing any issues while setting up the project in MacOS, check out the [Trobleshooting post](https://github.com/Grow-with-Open-Source/Notebook/discussions/3#discussioncomment-7151280) within the [Help Request](https://github.com/Grow-with-Open-Source/Notebook/discussions/3 "Goto Help Request Discussion") discussion.
{: .prompt-warning}

- Install `chruby` and `ruby-install` with Homebrew:
```bash
brew install chruby ruby-install xz
```

- Install the latest stable version of Ruby _(supported by Jekyll[^jekyll-offical-website])_:
```bash
ruby-install ruby 3.1.3
```

- This will take a few minutes, and once it’s done, configure your shell to automatically use chruby:
```bash
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-3.1.3" >> ~/.zshrc # run 'chruby' to see actual version
```

> If you’re using Bash, replace `.zshrc` with `.bash_profile`. If you’re not sure, read this external guide to [find out which shell you’re using](https://www.moncefbelyamani.com/which-shell-am-i-using-how-can-i-switch/ "find you shell").
{: .prompt-info}

- Quit and relaunch Terminal, then check that everything is working:
```bash
ruby -v
```

- After installing Ruby with chruby, install the latest Jekyll & bundler gem:
```bash
gem install bundler jekyll
```

- Use the following command to check whether the `bundler` and jekyll framework installed properly or not.
```bash
bundle info --path jekyll-theme-chirpy
```

### **Building the Project**

After setting up the environment, you can start contributing to the project:

- Start by [forking](https://github.com/ptmkhanh29/blog-personal/fork "let's fork the repo") the repository.

- Clone the forked repository to your local machine.
  ```bash
  #cloning the repo
  git clone https://github.com/<your-github-user-name>/blog-personal.git

  #entering the project directory
  cd blog-personal
  ```

- Use the following command to install project dependencies.
```bash
bundle
```

- Host the static website locally using the following command to preview the current state of the project.
```bash
bundle exec jekyll s
```

> Use `--incremental` argument to update the project live while working on it...
```bash
bundler exec jekyll s --incremental
```
{: .prompt-tip}

> If project build is successful, then you can view the project build that is hosted through your [localhost:4000](http://127.0.0.1:4000/). Well done, you have successfully setted up the project within your local system.
{: .prompt-info}

## How to deploy to Netlify

You can deploy it to https://app.netlify.com

- **Step 1:** Now, you can login Netfiy with account Github

- **Step 2:** Add Your New Site: 

Once you log in to Netlify, you'll be taken to https://app.netlify.com/. From here, select **Site** in sidebar, click **Import from git**

![chripy demo page](add-new-site-tutorial-1.png)

- **Step 3:** Link to Your GitHub

Select **Deploy with GitHub** to link your repository.

![chripy demo page](add-new-site-tutorial-2.png)

It's time to allow Netlify and GitHub to talk to each other. Clicking the "Authorize Application" button will do just that. Netlify doesn't store your GitHub access token on our servers. If you'd like to know more about the permissions Netlify requests and why we need them, you can visit https://www.netlify.com/docs/github-permissions/.

- **Step 4**: Choose Your Repo

Now that you've connected Netlify and GitHub, you can see a list of your Git repos. There's the "jekyll" repo you just pushed to GitHub. Let's select it.

![chripy demo page](add-new-site-tutorial-3.png)


- **Step 5**: Configure Build Setting

Netlify will automatically try to detect the build settings. For a Jekyll project, you need to configure the following:

**Build Command:** enter `jekyll build` or `bundle exec jekyll build` if you use Bundler.

**Publish directory:** enter `_site/`, this is the directory that Jekyll creates after building (unless you have another custom configuration).

(Optional) You may need to set an environment variable, like JEKYLL_ENV=production if needed. (In my site, I skip this option).

And click **Deploy 'Your-site'**

![chripy demo page](add-new-site-tutorial-4.png)

 - **Step 6**: Deploy succsee

![chripy demo page](add-new-site-tutorial-6.png)

You can review the built steps in the **Deploy** tab

![chripy demo page](add-new-site-tutorial-7.png)


## Contribution Guidelines

To contribute effectively, please follow these guidelines:

- All of the technical writing will be done in Markdown format. So, Make yourself more comfortable Markdown sytnax through [Offical GitHub Documentation](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/quickstart-for-writing-on-github "visit the offical GitHub Docs").

- Since this open source is based chripy[^chripy-offical-website] theme jekyll project, You're not limited by Markdown only. You can do much more using simple Markdown that support limited HTML elements. Check out the Chirpy-based [post creation](https://chirpy.cotes.page/posts/write-a-new-post/) and [text and typography](https://chirpy.cotes.page/posts/text-and-typography/).

- Place your technical writing files within the **`_posts`{: .filepath}.** directory, following the naming convention **`YYYY-MM-DD-file-name.md`**, e.g., `2023-09-27-welcome-to-notebook.md`. **Use lowercase letters and separate words with a single dash.**

- Add your author details to the **`_data/authors.yml`{: .filepath}.** file in the following format:
```yaml
unique_key_value:
    name: <author_name>
    twitter: <twitter_id>
    url: <personal (or) contact url>
```

> For example:
```yaml
khanhphan:
  name: Khanh Phan
  facebook: MinhKhanhPhanTruong
  url: https://github.com/ptmkhanh29
```
{: .prompt-tip file='_data/authors.yml'}

- Store images used in your content in **`assets/img/<your-project-name>/`{: .filepath}**. While using external CDN links is recommended, you can also place files in this directory if necessary.

- Each technical writing Markdown file should begin with the following configuration:
  ```md
  ---
  title: <title>
  date: YYYY-MM-DD HH:MM:SS +/-TTTT
  categories: [<main_categories>, <sub_categories_1>, ..., <sub_categories_n>]
  tags: [<tag_1>, ..., <tag_n>]
  author: <respective_author_key_value>
  img_path: "/assets/img/<your_img_directory_name>/"
  image:
    path: <name_of_the_img_for_page_cover>
    alt: <alternative_text>
  ---

  # Your content writing begins here
  ```

> Example 1:
```md
---
title: Welcome to the Notebook
date: 2023-09-21 20:34:00 +0530
categories: [Welcome, Guide]
tags: [introduction]
author: shamith_watchdogs
img_path: "/assets/img/welcome-page/"
image:
  path: "welcome-img.jpg"
  alt: "Welcome Page"
---
```
{: .prompt-tip file='_posts/2023-09-21-welcome-page.md'}

> Example 2:
```md
---
title: Hiệu chuẩn cảm biến MPU6050 dùng Rasberry Pi 4
date: 2024-03-21 20:34:00 +0530
categories: [Raspberry Pi, MPU6050]
tags: [raspberry-pi, python, mpu6050, embedded]
author: khanhphan
img_path: "/assets/img/calibration-mpu6050-raspberry-pi4/"
image:
  path: "over-project.jpg"
  alt: "Calibration IMU senser MPU6050 using Rasberry Pi 4"
pin: true
---
```
{: .prompt-tip file='_posts/2024-03-21-calibration-mpu6050-raspberry-pi4.md'}

> Note that the `+/-TTTT` in the `date` section refers the **UTC offset**. You can find your **UTC offset** value by searching for your country in the [list of UTC](https://en.wikipedia.org/wiki/List_of_UTC_offsets "Goto List of UTC offsets"). And if you're from India, you can use the above UTC offset from the example.
{: .prompt-info}

Please ensure your contributions adhere to these guidelines to maintain consistency and make the project more accessible and user-friendly. **Happy contributing!**

## Footnote

[^jekyll-offical-website]: **GitHub's Jekyll Framework offical Page:** <https://jekyllrb.com>
[^other-linux-distros-installation]: **Other Linux Distro Installation:** <https://jekyllrb.com/docs/installation/other-linux/>
[^chripy-offical-website]: **Chirpy Jekyll theme's Offical Website:** <https://github.com/cotes2020/jekyll-theme-chirpy>
