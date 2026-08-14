CREATE TABLE public.daily_bulletins (
  id text PRIMARY KEY,
  bulletin_date date NOT NULL,
  update_time text,
  title text NOT NULL,
  source_path text,
  source_ext text,
  source_size bigint,
  preview_path text NOT NULL,
  cover_path text,
  page_count integer,
  file_size bigint,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.daily_bulletins TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.daily_bulletins TO authenticated;
GRANT ALL ON public.daily_bulletins TO service_role;

ALTER TABLE public.daily_bulletins ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read bulletins" ON public.daily_bulletins FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "Public insert bulletins" ON public.daily_bulletins FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "Public update bulletins" ON public.daily_bulletins FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Public delete bulletins" ON public.daily_bulletins FOR DELETE TO anon, authenticated USING (true);

CREATE INDEX idx_daily_bulletins_date ON public.daily_bulletins (bulletin_date DESC);

CREATE TRIGGER trg_daily_bulletins_touch BEFORE UPDATE ON public.daily_bulletins
FOR EACH ROW EXECUTE FUNCTION public.tg_touch_updated_at();