-- RLS Policies - Phase 1 Complete
alter table public.profiles enable row level security;
alter table public.videos enable row level security;
alter table public.wallets enable row level security;

create policy "public read profiles" on public.profiles for select using (true);
create policy "users update own profile" on public.profiles for update using (auth.uid() = id);

create policy "public read videos" on public.videos for select using (visibility = 'public' or auth.uid() = owner_id);
create policy "owners insert videos" on public.videos for insert with check (auth.uid() = owner_id);
create policy "owners delete videos" on public.videos for delete using (auth.uid() = owner_id);

create policy "own wallet read" on public.wallets for select using (auth.uid() = user_id);
