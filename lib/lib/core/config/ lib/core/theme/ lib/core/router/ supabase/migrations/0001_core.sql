-- Quantum Phase 1 Core
create extension if not exists pgcrypto;

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  username text unique not null check (char_length(username) between 3 and 32),
  display_name text not null,
  bio text,
  avatar_url text,
  banner_url text,
  verified boolean default false,
  is_admin boolean default false,
  is_banned boolean default false,
  followers_count int default 0,
  following_count int default 0,
  total_views bigint default 0,
  created_at timestamptz default now()
);

create table public.videos (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references public.profiles(id) on delete cascade,
  title text not null,
  description text,
  video_url text not null,
  thumbnail_url text,
  duration_seconds int,
  visibility text default 'public' check (visibility in ('public','private','followers')),
  views_count int default 0,
  likes_count int default 0,
  comments_count int default 0,
  created_at timestamptz default now()
);

create table public.follows (follower_id uuid references profiles(id) on delete cascade, following_id uuid references profiles(id) on delete cascade, created_at timestamptz default now(), primary key (follower_id, following_id));
create table public.likes (user_id uuid references profiles(id) on delete cascade, video_id uuid references videos(id) on delete cascade, created_at timestamptz default now(), primary key (user_id, video_id));
