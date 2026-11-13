--- tests/schema/tests.py.orig
+++ tests/schema/tests.py
@@ -18,0 +19 @@
+from django.db.migrations.state import ModelState, ProjectState
@@ -1882,0 +1884,3 @@
+        note = Note.objects.create(info="test note")
+        Author.objects.create(id=note.pk, name="test author")
+
@@ -1891,2 +1895,10 @@
-        # Alter AutoField to OneToOneField.
-        new_field_o2o = OneToOneField(Note, CASCADE)
+        # Render the model state after the rename, as migrations do. Reusing
+        # Author would reference its stale id column when SQLite DQS is off.
+        state = ProjectState()
+        for model in (Author, Note):
+            state.add_model(ModelState.from_model(model))
+        state.rename_field("schema", "author", "id", "note_ptr")
+        state.alter_field("schema", "author", "note_ptr", new_field.clone(), True)
+        renamed_author = state.apps.get_model("schema", "Author")
+        new_field = renamed_author._meta.get_field("note_ptr")
+        new_field_o2o = OneToOneField(state.apps.get_model("schema", "Note"), CASCADE)
@@ -1894,4 +1906,4 @@
-        new_field_o2o.model = Author
-
-        with connection.schema_editor() as editor:
-            editor.alter_field(Author, new_field, new_field_o2o, strict=True)
+        new_field_o2o.model = renamed_author
+
+        with connection.schema_editor() as editor:
+            editor.alter_field(renamed_author, new_field, new_field_o2o, strict=True)
@@ -1902,0 +1915,4 @@
+
+        with connection.cursor() as cursor:
+            cursor.execute("SELECT note_ptr_id FROM schema_author")
+            self.assertEqual(cursor.fetchone()[0], note.pk)
