## Gloit App

Gloit App是一个基于[Ember JS](http://emberjs.com)的应用，构建该应用的动机是希望能够探索出一条可以快速的开发模块化的应用的道路。一直以来都希望能找到一种方法，能够让开发应用如同搭积木一般。以前写C/C++、Java等等都有尝试，也取得了一些成绩，但是总是不是那么理想。如今准备使用Javascript从头再来过。目前Gloit App还处于起步阶段，因此不论接口还是各种构成都可能经常发生变化，所以如果希望使用Gloit App来开发应用的朋友请注意**风险**。

**说明**

Gloit App使用`ember-cli`构建，因此需要对[ember-cli](http://iamstef.net/ember-cli/)有一定的了解。另外，依赖的资源全部使用`Bower`进行管理，因此也还需要对[Bower](http://bower.io)有一定的了解。如果遇到什么问题，非常欢迎给我发邮件提问。也可以在[这里](https://github.com/gloit/gloit-app/issues)发Issue。

```bash
# 安装ember-cli
$ npm install -g ember-cli

# 安装bower
$ npm install -g bower
```

### Demo

Gloit App开发版本部署在divshot.io，你可以访问[http://development.gloit-app.divshot.io/](http://development.gloit-app.divshot.io/)来了解Gloit App是什么。

```
用户名：admin；密码：12345678。
```

### 使用说明

#### 自定义应用基调色

Gloit App通过变量`@base-color`来控制整个应用的基调色，默认颜色为`#0074D9`。如果希望改变基调色，只需要在`app/styles/app.less`修改`@base-color`的值即可。例如：

```less
@base-color: #3D9970;
```

### 开发

签出项目到本地：

```bash
$ git clone https://github.com/gloit/gloit-app
```

安装依赖：

```bash
$ npm install
```

启动应用：

```bash
$ ember server
```

打开浏览器，访问 http://localhost:4200
便可打开应用。默认用户名为：admin，密码为：123456。

### Windows

如果是在`Windows 7`以上使用此应用，请先安装[node.js](http://nodejs.org)，并把安装目录设置到`PATH`中。
然后安装`ember-cli`和`Bower`

```cmd
> npm install -g ember-cli
> npm install -g bower
```

最后把`node`的全局库目录`C:\Users\username\AppData\Roaming\npm`加入`PATH`中。
接下来的工作如上所述，不再重复。
