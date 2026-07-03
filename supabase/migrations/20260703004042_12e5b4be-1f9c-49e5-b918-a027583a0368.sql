
CREATE POLICY "Public read documents bucket" ON storage.objects
  FOR SELECT TO anon, authenticated
  USING (bucket_id = 'documents');

CREATE POLICY "Admins upload documents bucket" ON storage.objects
  FOR INSERT TO authenticated
  WITH CHECK (bucket_id = 'documents' AND public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Admins update documents bucket" ON storage.objects
  FOR UPDATE TO authenticated
  USING (bucket_id = 'documents' AND public.has_role(auth.uid(), 'admin'))
  WITH CHECK (bucket_id = 'documents' AND public.has_role(auth.uid(), 'admin'));

CREATE POLICY "Admins delete documents bucket" ON storage.objects
  FOR DELETE TO authenticated
  USING (bucket_id = 'documents' AND public.has_role(auth.uid(), 'admin'));
