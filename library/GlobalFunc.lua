---全局函数<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/introduction/globalfunc.html)
---@meta

---json 库
---@see cjson
---@class json
json = {}

---编码table数据为json
---@param table table table数据
---@return string jsonstr json格式字符串
function json.encode(table) end

---解码json字符串为table
---@param data string json格式字符串
---@return table tab 解码后的table
function json.decode(data) end

---获取当前世界对象
---@return table WorldObject 世界对象
function GetWorld() end

---打印错误信息至调试页面
function printError(...) end

---打印信息至调试页面
function print(...) end

---获取服务器时间
---@return number time 服务器时间
function getServerTime() end

---获取默认字符串
---@param id string|integer 字符串的id
---@param ... any
---@return string str
function GetS(id, ...) end

---定义类对象
---@param classname string 类名
---@param super string|table 父类名 或 父类原表
---@param issingle boolean 是否单例
---@return table classdef 对象定义
function Class(classname, super, issingle) end

---创建类实例
---@param classname string 类名
---@return table instance 对象实例
function Instance(classname) end

---获取类单例
---@param classname string 类名
---@return table instance 对象实例
function GetInst(classname) end

---深拷贝表
---@param ori_tab table
---@return table new_tab
function copy_table(ori_tab)
    if type(ori_tab) ~= "table" then
---@diagnostic disable-next-line: return-type-mismatch
    	return nil
    end

    local new_tab = {}

    for i, v in pairs(ori_tab) do
    	if type(v) == "table" then
    		new_tab[i] = copy_table(v)
    	else
    		new_tab[i] = v
    	end
    end

    return new_tab
end