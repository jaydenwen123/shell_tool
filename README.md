# 工作中办公效率提升神器汇总

> **在平常工作中，通常会有很多重复性的工作，而且使用比较频繁，因此本文下面主要进行介绍工作中常用的shell命令，用来提升工作效率**  

## 一、命令说明

1. **当前所有命令都是在mac环境下执行，如果linux或者windows，不敢确保命令100%能正常执行**
2. **所有命令都是遵循一个规则，首先编写完整的shell命令脚本，然后通过`ln -s xxx.sh xxx`的方式创建一个软连接，便于命令行使用**
3. **创建软链接的名称遵循缩写来命令，方便记忆**

## 二、如何使用

**1.克隆本项目到本地目录**

``` shell
git clone https://github.com/jaydenwen123/shell_tool.git
```

**2.将克隆后的本地目录加入到path环境变量中**

```shell
a. vim /etc/profile                  // vim 打开/etc/profile
b. export PATH=$PATH:"${currentDir}" //在/etc/profile中追加这菊花
c. source /etc/profile               //使得/etc/profile文件生效
```

**3.然后开心的玩耍**

```shell
例如：
1. ool github.com/jaydenwen123/shell_tool  //在浏览器中打开github.com/jaydenwen123/shell_tool
2. ool https://github.com/jaydenwen123/shell_tool  //在浏览器中打开github.com/jaydenwen123/shell_tool
3. ool //如果当前目录是个git工程并且绑定到了远程的分支，则会在浏览器端打开该工程
```


## 三、命令使用介绍


### 1.git 提交、推送远程命令gp
**该组命令主要用来完成通常的git add/commit/push等工作，通过命令来减少鼠标和界面操作**

	gp->git_push.sh
	git_push.sh

#### 使用案例

**1.将当前工程中的所有更改添加通过指定的msg提交，并推送远程**

``` shell
//在gp后面跟提交信息msg即可

 ~/shell_tool git:(master) ✗ gp "feat(git_push.sh):update git add/commit/push shell tool"
[INFO] git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   README.md
        modified:   git_push.sh

no changes added to commit (use "git add" and/or "git commit -a")
[INFO] exec git add .
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   README.md
        modified:   git_push.sh

[INFO] exec git commit -m feat(git_push.sh):update git add/commit/push shell tool
[master 1fc8af9] feat(git_push.sh):update git add/commit/push shell tool
 2 files changed, 85 insertions(+), 4 deletions(-)
 rewrite README.md (98%)
[INFO] git push origin master
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 12 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 1.66 KiB | 1.67 MiB/s, done.
Total 4 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/jaydenwen123/shell_tool.git
   cb935bb..1fc8af9  master -> master
	
```

**2.将当前工作区的修改，通过指定的msg提交，但不推动到远程仓库**

```shell
//在指定的提交消息后面打个空格，然后随便输入一些信息，则只会commit不会执行push
➜  ~/shell_tool git:(master) gp "docs:update REAME.md" "1"
[INFO] git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
[INFO] exec git add .
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   README.md

[INFO] exec git commit -m docs:update REAME.md
[master 7626d45] docs:update REAME.md
 1 file changed, 16 insertions(+), 1 deletion(-)

```

**3.将当前分支的所有提交推送到远程**

```shell
//不带任何参数,则将所有的提交推送到远程仓库
➜  ~/shell_tool git:(master) gp

[INFO] execute action:<git push origin master>
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 544 bytes | 544.00 KiB/s, done.
Total 3 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/jaydenwen123/shell_tool.git
   f7e454d..7626d45  master -> master
```


### 2.git 查看当前工作区状态命令gs
	git_status.sh
	gs->git_status.sh
	
### 3.git 初始化本地目录为仓库命令igp
	igp->init_git_project.sh
	init_git_project.sh
	
### 4.创建git工程命令
	cgp->create_git_project.sh
	create_git_project.sh

### 5.打开git 仓库命令oo
	oo->open_git_project.sh
	open_git_project.sh
	
### 6.打开git 个人主页、组织首页命令og

	og->open_git_group.sh
	open_git_group.sh

### 7.便捷登录个人云服务器命令mm
	mm->ssh_cloud_server.sh
	ssh_cloud_server.sh
	
### 8.打开git开源项目命令ool
	ool->open_other_library.sh
	open_other_library.sh

### 9.便捷打开rick平台命令oor
	oor->open_rick.sh
	open_rick.sh

