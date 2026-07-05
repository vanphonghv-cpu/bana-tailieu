
-- Documents table: allow anon writes (app-level password gate controls UI)
GRANT INSERT, UPDATE, DELETE ON public.documents TO anon;

DROP POLICY IF EXISTS "Admins insert documents" ON public.documents;
DROP POLICY IF EXISTS "Admins update documents" ON public.documents;
DROP POLICY IF EXISTS "Admins delete documents" ON public.documents;

CREATE POLICY "Public insert documents" ON public.documents
  FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "Public update documents" ON public.documents
  FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Public delete documents" ON public.documents
  FOR DELETE TO anon, authenticated USING (true);

-- Storage: allow anon read/write on the documents bucket
DROP POLICY IF EXISTS "documents public read" ON storage.objects;
DROP POLICY IF EXISTS "documents admin write" ON storage.objects;
DROP POLICY IF EXISTS "documents admin update" ON storage.objects;
DROP POLICY IF EXISTS "documents admin delete" ON storage.objects;
DROP POLICY IF EXISTS "documents public write" ON storage.objects;
DROP POLICY IF EXISTS "documents public update" ON storage.objects;
DROP POLICY IF EXISTS "documents public delete" ON storage.objects;

CREATE POLICY "documents public read" ON storage.objects
  FOR SELECT TO anon, authenticated USING (bucket_id = 'documents');
CREATE POLICY "documents public write" ON storage.objects
  FOR INSERT TO anon, authenticated WITH CHECK (bucket_id = 'documents');
CREATE POLICY "documents public update" ON storage.objects
  FOR UPDATE TO anon, authenticated USING (bucket_id = 'documents') WITH CHECK (bucket_id = 'documents');
CREATE POLICY "documents public delete" ON storage.objects
  FOR DELETE TO anon, authenticated USING (bucket_id = 'documents');
