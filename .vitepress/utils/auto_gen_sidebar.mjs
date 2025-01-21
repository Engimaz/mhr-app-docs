import fs from "node:fs";
import path from "node:path";
// 文件根目录
const DIR_PATH = path.resolve();
// 白名单,过滤不是文章的文件和文件夹
const WHITE_LIST = [
    "index.md",
    ".vitepress",
    "node_modules",
    ".idea",
    ".git",
    ".github",
    "file",
    "img",
    "assets",
];

// 判断是否是文件夹
const isDirectory = (path) => fs.lstatSync(path).isDirectory();

// 取差值
const intersections = (arr1, arr2) =>
    Array.from(new Set(arr1.filter((item) => !new Set(arr2).has(item))));

// 把方法导出直接使用
function getList(params, path1, pathname) {
    // 存放结果
    const res = [];
    // 开始遍历params
    for (let file in params) {
        // 拼接目录
        const dir = path.join(path1, params[file]);
        // 判断是否是文件夹
        const isDir = isDirectory(dir);
        if (isDir) {
            // 如果是文件夹,读取之后作为下一次递归参数
            const files = fs.readdirSync(dir);
            res.push({
                text: params[file],
                items: getList(files, dir, `${pathname}/${params[file]}`),
            });
        } else {
            // 获取名字
            const name = path.basename(params[file]);
            // 排除非 md 文件
            const suffix = path.extname(params[file]);
            if (suffix !== ".md") {
                continue;
            }
            res.push({
                text: name,
                link: `${pathname}/${name}`,
            });
        }
    }
    // 对name做一下处理，把后缀删除
    res.map((item) => {
        item.text = item.text.replace(/\.md$/, "");
    });
    return res;
}

// 把方法导出直接使用
const getSendNav = (pathname) => {
    // 存放结果
    const res = [];
    // 判断是否是文件夹
    const sendDir = fs.readdirSync(pathname);
    for (let file in sendDir) {
        const dir = path.join(pathname, sendDir[file]);
        const isDir = isDirectory(dir);
        if (isDir) {
            const name = path.basename(sendDir[file]);
            // 如果是文件夹,读取之后作为下一次递归参数
            res.push({
                text: name,
                link: dir,
            });
        }
    }

    return res;
};

const set_sidebar = (pathname) => {
    const dirPath = path.join(DIR_PATH, pathname);
    const files = fs.readdirSync(dirPath);
    const items = intersections(files, WHITE_LIST);
    const list = getList(items, dirPath, pathname);
    return list;
};

// 从二级导航开始就是左边导航
export const gen_catelog = (pathname) => {
    const sendDir = gen_nav(pathname);
    const files = [];
    for (let file of sendDir) {
        for (let item of file.items) {
            files.push(item.link);
        }
    }
    const directories = [];
    files.forEach((file) => {
        if (isDirectory(file)) {
            if (!WHITE_LIST.includes(file)) {
                directories.push(file);
            }
        }
    });

    const directoriesWithSidebar = directories.reduce((obj, item) => {
        const route = `/${item}`;
        obj[route] = set_sidebar(route);
        return obj;
    }, {});
    return directoriesWithSidebar;
};

// 生成二级目录做顶部导航
export const gen_nav = (pathname) => {
    const dirPath = path.join(DIR_PATH, pathname);
    const files = fs.readdirSync(dirPath);
    const directories = [];
    files.forEach((file) => {
        const fullPath = path.join(dirPath, file);
        if (isDirectory(fullPath)) {
            if (!WHITE_LIST.includes(file)) {
                directories.push(file);
            }
        }
    });
    const res = directories.map((dir) => {
        return {
            text: dir,
            items: getSendNav(dir),
        };
    });
    return res;
};
