ALTER TABLE public.documents DROP CONSTRAINT IF EXISTS documents_document_type_check;

ALTER TABLE public.documents
  ADD COLUMN IF NOT EXISTS description text,
  ADD COLUMN IF NOT EXISTS keywords text,
  ADD COLUMN IF NOT EXISTS featured boolean NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS status text NOT NULL DEFAULT 'published',
  ADD COLUMN IF NOT EXISTS sort_order integer NOT NULL DEFAULT 0;

ALTER TABLE public.documents ALTER COLUMN document_type DROP DEFAULT;

UPDATE public.documents SET document_type = 'digital-transformation'
  WHERE document_type = 'digital_transformation';
UPDATE public.documents SET document_type = 'meeting-conference'
  WHERE document_type = 'meeting';

ALTER TABLE public.documents ALTER COLUMN document_type SET DEFAULT 'meeting-conference';

ALTER TABLE public.documents ADD CONSTRAINT documents_document_type_check
  CHECK (document_type IN ('digital-transformation','meeting-conference','office-operations'));