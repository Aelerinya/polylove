-- This file is autogenerated from regen-schema.ts
create table if not exists
  love_answers (
    created_time timestamp with time zone default now() not null,
    creator_id text not null,
    free_response text,
    id bigint primary key love_answers_pkey generated always as identity not null,
    integer integer,
    multiple_choice integer,
    question_id bigint not null
  );

-- Row Level Security
alter table love_answers enable row level security;

-- Policies
drop policy if exists "public read" on love_answers;

create policy "public read" on love_answers for
select
  using (true);

drop policy if exists "self delete" on love_answers;

create policy "self delete" on love_answers for delete using ((creator_id = firebase_uid ()));

drop policy if exists "self insert" on love_answers;

create policy "self insert" on love_answers for insert
with
  check ((creator_id = firebase_uid ()));

drop policy if exists "self update" on love_answers;

create policy "self update" on love_answers
for update
  using ((creator_id = firebase_uid ()));

-- Indexes
drop index if exists love_answers_creator_id_created_time_idx;

create index love_answers_creator_id_created_time_idx on public.love_answers using btree (creator_id, created_time desc);

drop index if exists love_answers_pkey;

create unique index love_answers_pkey on public.love_answers using btree (id);

drop index if exists love_answers_question_creator_unique;

create unique index love_answers_question_creator_unique on public.love_answers using btree (question_id, creator_id);

drop index if exists love_answers_question_id_idx;

create index love_answers_question_id_idx on public.love_answers using btree (question_id);
