import markdownItTextualUml from "markdown-it-textual-uml";
import {defineConfig} from "vitepress";
import {withMermaid} from "vitepress-plugin-mermaid";
import {gen_catelog, gen_nav} from "./utils/auto_gen_sidebar.mjs";
// https://vitepress.dev/reference/site-config
const nav=[{text: "首页", link: "./"}]
const _nav: Array<any> = gen_nav("./");
nav.push(..._nav)
const config = defineConfig({
    base: "/mhr-app-docs/",
    markdown: {
        config: (md) => {
            md.use(markdownItTextualUml);
        },
    },
    title: "enigma的文档",
    description: "记录一些学习笔记",
    themeConfig: {
        outline: [2, 6],

        // https://vitepress.dev/reference/default-theme-config
        nav: nav,
        sidebar: gen_catelog("./"),
        socialLinks: [
            {
                icon: {
                    svg: '<?xml version="1.0" encoding="utf-8"?><svg fill="#000000" width="36px" height="36px" viewBox="0 0 24 24" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M11.984 0A12 12 0 0 0 0 12a12 12 0 0 0 12 12 12 12 0 0 0 12-12A12 12 0 0 0 12 0a12 12 0 0 0-.016 0zm6.09 5.333c.328 0 .593.266.592.593v1.482a.594.594 0 0 1-.593.592H9.777c-.982 0-1.778.796-1.778 1.778v5.63c0 .327.266.592.593.592h5.63c.982 0 1.778-.796 1.778-1.778v-.296a.593.593 0 0 0-.592-.593h-4.15a.592.592 0 0 1-.592-.592v-1.482a.593.593 0 0 1 .593-.592h6.815c.327 0 .593.265.593.592v3.408a4 4 0 0 1-4 4H5.926a.593.593 0 0 1-.593-.593V9.778a4.444 4.444 0 0 1 4.445-4.444h8.296z"/></svg>'
                },
                link: "https://gitee.com/AICHEN517"
            },
            {icon: "github", link: "https://github.com/Engimaz"}
        ],

        footer: {
            copyright: "Copyright @ 2025 enigma",
        },
    },
});
export default withMermaid(config);
