import markdownItTextualUml from "markdown-it-textual-uml";
import { defineConfig } from "vitepress";
import { withMermaid } from "vitepress-plugin-mermaid";
import { gen_catelog, gen_nav } from "./utils/auto_gen_sidebar.mjs";
// https://vitepress.dev/reference/site-config
const nav:Array<any> = gen_nav("./");
nav.push({ text: "首页", link: "./" })
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
    nav:nav,
    sidebar: gen_catelog("./"),
    socialLinks: [
      { icon: "github", link: "https://github.com/vuejs/vitepress" },
    ],

    footer: {
      copyright: "Copyright @ 2025 enigma",
    },
  },
});
export default withMermaid(config);
