-- Monetization: Wallet, Gifts, Referrals (Ledger-based)
create table public.wallets (
  user_id uuid primary key references profiles(id) on delete cascade,
  available_cents bigint default 0,
  pending_cents bigint default 0,
  lifetime_earned_cents bigint default 0,
  updated_at timestamptz default now()
);

create table public.ledger_entries (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references profiles(id),
  amount_cents bigint not null,
  type text not null check (type in ('gift_earn','referral_bonus','withdrawal','withdrawal_refund','adjustment')),
  ref_id uuid,
  created_at timestamptz default now()
);

create table public.gifts (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid references profiles(id),
  receiver_id uuid references profiles(id),
  video_id uuid references videos(id),
  amount_cents bigint not null,
  created_at timestamptz default now()
);

create table public.referrals (
  id uuid primary key default gen_random_uuid(),
  referrer_id uuid references profiles(id),
  referred_id uuid unique references profiles(id),
  code text unique not null,
  bonus_cents bigint default 0,
  status text default 'pending',
  created_at timestamptz default now()
);

create table public.withdrawals (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id),
  amount_cents bigint not null,
  status text default 'pending' check (status in ('pending','approved','rejected')),
  created_at timestamptz default now()
);
