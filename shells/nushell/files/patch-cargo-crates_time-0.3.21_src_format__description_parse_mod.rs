--- cargo-crates/time-0.3.21/src/format_description/parse/mod.rs.orig
+++ cargo-crates/time-0.3.21/src/format_description/parse/mod.rs
@@ -80,7 +80,7 @@ pub fn parse_owned<const VERSION: usize>(
     let mut lexed = lexer::lex::<VERSION>(s.as_bytes());
     let ast = ast::parse::<_, VERSION>(&mut lexed);
     let format_items = format_item::parse(ast);
-    let items = format_items
+    let items: Box<_> = format_items
         .map(|res| res.map(Into::into))
         .collect::<Result<Box<_>, _>>()?;
     Ok(items.into())
