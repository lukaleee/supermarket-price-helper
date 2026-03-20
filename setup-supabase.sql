-- =============================================
-- 小超市价格助手 - Supabase 建表脚本
-- 
-- 使用方法：
-- 1. 登录 Supabase Dashboard (https://supabase.com/dashboard)
-- 2. 选择你的项目
-- 3. 点左边菜单的 "SQL Editor"
-- 4. 把这段代码全部复制粘贴进去
-- 5. 点 "Run" 执行
-- =============================================

-- 创建商品表
CREATE TABLE IF NOT EXISTS products (
  barcode TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  cost NUMERIC(10,2) NOT NULL DEFAULT 0,
  sell NUMERIC(10,2) NOT NULL DEFAULT 0,
  category TEXT DEFAULT '',
  note TEXT DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 开启行级安全（RLS）但允许匿名用户完全访问
-- 这对小超市场景足够了，数据不涉及隐私
ALTER TABLE products ENABLE ROW LEVEL SECURITY;

-- 允许匿名用户读取所有商品
CREATE POLICY "允许所有人读取商品" ON products
  FOR SELECT USING (true);

-- 允许匿名用户添加商品
CREATE POLICY "允许所有人添加商品" ON products
  FOR INSERT WITH CHECK (true);

-- 允许匿名用户修改商品
CREATE POLICY "允许所有人修改商品" ON products
  FOR UPDATE USING (true);

-- 允许匿名用户删除商品
CREATE POLICY "允许所有人删除商品" ON products
  FOR DELETE USING (true);

-- 完成！现在去设置页面获取你的 URL 和 Key
-- Dashboard -> Settings -> API
-- 需要：Project URL 和 anon public key
