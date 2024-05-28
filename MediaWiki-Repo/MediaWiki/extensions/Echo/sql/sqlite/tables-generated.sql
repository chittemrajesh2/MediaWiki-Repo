-- This file is automatically generated using maintenance/generateSchemaSql.php.
-- Source: sql/tables.json
-- Do not modify this file directly.
-- See https://www.mediawiki.org/wiki/Manual:Schema_changes
CREATE TABLE /*_*/echo_event (
  event_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  event_type BLOB NOT NULL, event_variant BLOB DEFAULT NULL,
  event_agent_id INTEGER UNSIGNED DEFAULT NULL,
  event_agent_ip BLOB DEFAULT NULL,
  event_extra BLOB DEFAULT NULL, event_page_id INTEGER UNSIGNED DEFAULT NULL,
  event_deleted SMALLINT UNSIGNED DEFAULT 0 NOT NULL
);

CREATE INDEX echo_event_type ON /*_*/echo_event (event_type);

CREATE INDEX echo_event_page_id ON /*_*/echo_event (event_page_id);


CREATE TABLE /*_*/echo_notification (
  notification_event INTEGER UNSIGNED NOT NULL,
  notification_user INTEGER UNSIGNED NOT NULL,
  notification_timestamp BLOB NOT NULL,
  notification_read_timestamp BLOB DEFAULT NULL,
  notification_bundle_hash BLOB NOT NULL,
  PRIMARY KEY(
    notification_user, notification_event
  )
);

CREATE INDEX echo_user_timestamp ON /*_*/echo_notification (
  notification_user, notification_timestamp
);

CREATE INDEX echo_notification_event ON /*_*/echo_notification (notification_event);

CREATE INDEX echo_notification_user_read_timestamp ON /*_*/echo_notification (
  notification_user, notification_read_timestamp
);


CREATE TABLE /*_*/echo_email_batch (
  eeb_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  eeb_user_id INTEGER UNSIGNED NOT NULL,
  eeb_event_priority SMALLINT UNSIGNED DEFAULT 10 NOT NULL,
  eeb_event_id INTEGER UNSIGNED NOT NULL,
  eeb_event_hash BLOB NOT NULL
);

CREATE UNIQUE INDEX echo_email_batch_user_event ON /*_*/echo_email_batch (eeb_user_id, eeb_event_id);

CREATE INDEX echo_email_batch_user_hash_priority ON /*_*/echo_email_batch (
  eeb_user_id, eeb_event_hash, eeb_event_priority
);


CREATE TABLE /*_*/echo_target_page (
  etp_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  etp_page INTEGER UNSIGNED DEFAULT 0 NOT NULL,
  etp_event INTEGER UNSIGNED DEFAULT 0 NOT NULL
);

CREATE INDEX echo_target_page_event ON /*_*/echo_target_page (etp_event);

CREATE INDEX echo_target_page_page_event ON /*_*/echo_target_page (etp_page, etp_event);


CREATE TABLE /*_*/echo_push_provider (
  epp_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  epp_name BLOB NOT NULL
);


CREATE TABLE /*_*/echo_push_subscription (
  eps_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  eps_user INTEGER UNSIGNED NOT NULL,
  eps_token BLOB NOT NULL,
  eps_token_sha256 CHAR(64) NOT NULL,
  eps_provider SMALLINT UNSIGNED NOT NULL,
  eps_updated DATETIME NOT NULL,
  eps_data BLOB DEFAULT NULL,
  eps_topic SMALLINT UNSIGNED DEFAULT NULL
);

CREATE UNIQUE INDEX eps_token_sha256 ON /*_*/echo_push_subscription (eps_token_sha256);

CREATE INDEX eps_provider ON /*_*/echo_push_subscription (eps_provider);

CREATE INDEX eps_topic ON /*_*/echo_push_subscription (eps_topic);

CREATE INDEX eps_user ON /*_*/echo_push_subscription (eps_user);

CREATE INDEX eps_token ON /*_*/echo_push_subscription (eps_token);


CREATE TABLE /*_*/echo_push_topic (
  ept_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  ept_text BLOB NOT NULL
);
