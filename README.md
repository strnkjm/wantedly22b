# Database structure
## feeds テーブル

|Column|Type|Options|
|------|----|-------|
|title|text|null: false, index: true|
|content|text|null: false, index: true|
|user_id|int|null: false, index: true, foreign_key: true|
|company_id|int|null: false, index: true, foreign_key: true|

### association
- belongs_to :user
- belongs_to :company
- has_many :images

## messages テーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|int|null: false, foreign_key: true|
|project_id|int|null: false, foreign_key: true|

### association
- belongs_to :user
- belongs_to :project

## projects テーブル

|Column|Type|Options|
|------|----|-------|
|title|text|null: false, index: true|
|content|text|null: false|
|company_id|int|null: false, index: true, foreign_key: true|
|job_title|str|null: false|
|job_type|int|null: false, index: true|


### association
- belongs_to :company
- has_many :messages

## images テーブル

|Column|Type|Options|
|------|----|-------|
|url|text|null: false|
|feed_id|int|null: false, foreign_key: true|

### association
- belongs_to :feed


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null, false, unique: true|
|password|string|null: false|
|catchcopy|string||
|profile|string||
|future|string||
|gender|string||
|birthday|integer||
|cover_image|string||
|profile_image|string||
|tel|integer||
|company_id|string|null: false, foreign_key: true|

<!-- profile     = 自己紹介文
     future      = この先やってみたいこと -->

### association
- has many :messages
- has many :feeds
- has many :companies through: :employments
- has many :certificates
- has many :papers
- has many :awards
- has many :links
- has many :portfolios
- has many :topics
- has many :project_in_schools
- has many :languages
- has many :seminars
- has many :academics
- has many :other_actions
- has many :skills through: :abilities


## certificatesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|data|string||
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user


<!-- 執筆歴 -->
## papersテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|year|string||
|month|string||
|url|string||
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user


## awardsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|year|string||
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user


## linksテーブル

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user


## portforiosテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string||
|youtube|string||
|url|string||
|detail|text||
|created_date|integer||
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user


## topicsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user


## project_in_schoolsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|url|string||
|start_date|integer||
|left_date|integer||
|detail|text||
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user


## languagesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|level|string|null: false|
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user


## seminarsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|url|string||
|start_date|integer||
|left_date|integer||
|detail|text||
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user


## academicsテーブル

|Column|Type|Options|
|------|----|-------|
|school|string|null: false|
|major|string||
|graduation_date|integer||
|detail|text||
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user


## skillsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|string|null: false, foreign_key: true|

### association
- has many :user through: :abillities


## other_actionsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|url|string||
|start_date|integer||
|left_date|integer||
|detail|text||
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user


## toolsテーブル

Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|logo|string|null, false, unique: true|
|company_id|string|null: false, foreign_key: true|

### association
- has many :companies through: :groups


## companiesテーブル

Column|Type|Options|
|------|----|-------|
|name|string|null: false, add: index|
|url|string|null, false, unique: true|
|logo|string|null, false, unique: true|
|business_type|string|null, false|
|image|string||
|what_content|text|null, false|
|why_content|text|null, false|
|how_content|text|null, false|
|founder|string|null, false|
|employees|integer|null, false|
|catchcopy|string|null, false|
|cover_image|string||
|profile|text|null, false|
|tool_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

<!-- businessType     = 事業形態
     whatContent      = 何をやっているか
     whyContent       = なぜやっているか
     howContent       = どうやっているか
     founder          = 創業者
     profile          = 私たちについて -->

### association
- has many :users through: :employments
- has many :feeds
- has many :projects
- has many :tools through: :groups


<!--toolとcompanyの中間テーブル-->
## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|tool_id|integer|null: false, foreign_key: true|
|company_id|integer|null: false, foreign_key: true|

### association
- belongs_to :company
- belongs_to :tool


<!--skillsとusersの中間テーブル-->
## abillitiesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|skill_id|integer|null: false, foreign_key: true|

### association
- belongs_to :user
- belongs_to :skill


<!--companiesとusersの中間テーブル-->
## employmentsテーブル

|Column|Type|Options|
|------|----|-------|
|start_date|string||
|left_data|string||
|position|string|null: false|
|parttime_job|boolean||
|detail|text||
|company_id|string|null: false, foreign_key: true|
|user_id|string|null: false, foreign_key: true|

### association
- belong_to :user
- belong_to :company
