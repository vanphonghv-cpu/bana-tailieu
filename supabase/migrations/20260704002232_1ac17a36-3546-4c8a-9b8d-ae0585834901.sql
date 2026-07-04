
ALTER TABLE public.documents
  ADD COLUMN IF NOT EXISTS document_type text NOT NULL DEFAULT 'meeting'
  CHECK (document_type IN ('digital_transformation','meeting'));
