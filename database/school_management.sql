/*
 Navicat Premium Data Transfer

 Source Server         : laragon
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : school_management

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 14/11/2021 23:25:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fee_categories
-- ----------------------------
DROP TABLE IF EXISTS `fee_categories`;
CREATE TABLE `fee_categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `fee_categories_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fee_categories
-- ----------------------------
INSERT INTO `fee_categories` VALUES (1, 'Registration Fee', '2021-11-14 17:20:49', '2021-11-14 17:20:49');
INSERT INTO `fee_categories` VALUES (3, 'Exam Fee', '2021-11-14 17:23:21', '2021-11-14 17:23:21');
INSERT INTO `fee_categories` VALUES (4, 'Monthly Fee', '2021-11-14 17:23:31', '2021-11-14 17:23:31');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_10_20_162944_create_sessions_table', 1);
INSERT INTO `migrations` VALUES (7, '2014_10_12_000000_create_users_table', 2);
INSERT INTO `migrations` VALUES (8, '2021_11_09_155315_create_student_classes_table', 3);
INSERT INTO `migrations` VALUES (9, '2021_11_12_044553_create_student_years_table', 4);
INSERT INTO `migrations` VALUES (10, '2021_11_14_155120_create_student_groups_table', 5);
INSERT INTO `migrations` VALUES (12, '2021_11_14_163456_create_student_shifts_table', 6);
INSERT INTO `migrations` VALUES (13, '2021_11_14_170006_create_fee_categories_table', 7);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('kfWHF91Eh1FpWdIIEN9idfMXZABQVRdIed2iWXIt', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoibzhYc08xWmtJckNmU3BzMGlRRUtMZzhnRVBIZWJBUHNHd2Yxdmd4MCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjU0OiJodHRwOi8vc2Nob29sX21hbmFnZW1lbnQudGVzdC9zZXR1cHMvZmVlL2NhdGVnb3J5L3ZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkbW8wc0luLzhITzlOSW5aaUxCSDdMLk9nUmpoUnZFY0FvZGJSYlB1OUk4dmVaLmx5L0FuUzYiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJG1vMHNJbi84SE85TkluWmlMQkg3TC5PZ1JqaFJ2RWNBb2RiUmJQdTlJOHZlWi5seS9BblM2Ijt9', 1636910611);

-- ----------------------------
-- Table structure for student_classes
-- ----------------------------
DROP TABLE IF EXISTS `student_classes`;
CREATE TABLE `student_classes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_classes_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_classes
-- ----------------------------
INSERT INTO `student_classes` VALUES (2, 'Class Two', '2021-11-09 16:50:04', '2021-11-09 16:50:04');
INSERT INTO `student_classes` VALUES (3, 'Class Three', '2021-11-09 16:50:19', '2021-11-09 16:50:19');
INSERT INTO `student_classes` VALUES (4, 'Class Four', '2021-11-09 16:50:32', '2021-11-09 16:50:32');

-- ----------------------------
-- Table structure for student_groups
-- ----------------------------
DROP TABLE IF EXISTS `student_groups`;
CREATE TABLE `student_groups`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_groups_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_groups
-- ----------------------------
INSERT INTO `student_groups` VALUES (1, 'Science', '2021-11-14 16:01:43', '2021-11-14 16:04:38');
INSERT INTO `student_groups` VALUES (2, 'Commerce', '2021-11-14 16:05:03', '2021-11-14 16:05:03');
INSERT INTO `student_groups` VALUES (4, 'Arts', '2021-11-14 16:05:44', '2021-11-14 16:05:44');

-- ----------------------------
-- Table structure for student_shifts
-- ----------------------------
DROP TABLE IF EXISTS `student_shifts`;
CREATE TABLE `student_shifts`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_shifts_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_shifts
-- ----------------------------
INSERT INTO `student_shifts` VALUES (1, 'Morning', '2021-11-14 16:47:39', '2021-11-14 16:50:36');
INSERT INTO `student_shifts` VALUES (2, 'Afternoon', '2021-11-14 16:50:59', '2021-11-14 16:50:59');

-- ----------------------------
-- Table structure for student_years
-- ----------------------------
DROP TABLE IF EXISTS `student_years`;
CREATE TABLE `student_years`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_years_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_years
-- ----------------------------
INSERT INTO `student_years` VALUES (1, '2011', '2021-11-12 05:07:34', '2021-11-12 05:12:16');
INSERT INTO `student_years` VALUES (2, '2010', '2021-11-14 15:30:39', '2021-11-14 15:30:39');
INSERT INTO `student_years` VALUES (3, '2012', '2021-11-14 15:30:46', '2021-11-14 15:30:46');
INSERT INTO `student_years` VALUES (4, '2013', '2021-11-14 15:30:53', '2021-11-14 15:30:53');
INSERT INTO `student_years` VALUES (5, '2014', '2021-11-14 15:31:08', '2021-11-14 15:31:08');
INSERT INTO `student_years` VALUES (6, '2015', '2021-11-14 15:31:28', '2021-11-14 15:31:28');
INSERT INTO `student_years` VALUES (7, '2016', '2021-11-14 15:31:37', '2021-11-14 15:31:37');
INSERT INTO `student_years` VALUES (8, '2017', '2021-11-14 15:31:44', '2021-11-14 15:31:44');
INSERT INTO `student_years` VALUES (9, '2018', '2021-11-14 15:31:52', '2021-11-14 15:31:52');
INSERT INTO `student_years` VALUES (10, '2019', '2021-11-14 15:32:16', '2021-11-14 15:32:16');
INSERT INTO `student_years` VALUES (11, '2020', '2021-11-14 15:32:31', '2021-11-14 15:32:31');
INSERT INTO `student_years` VALUES (12, '2021', '2021-11-14 15:32:38', '2021-11-14 15:32:38');
INSERT INTO `student_years` VALUES (13, '2022', '2021-11-14 15:32:50', '2021-11-14 15:32:50');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usertype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(255) NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `profile_photo_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'Ashik Chowdhury', 'ashikbracu@gmail.com', NULL, '$2y$10$mo0sIn/8HO9NInZiLBH7L.OgRjhRvEcAodbRbPu9I8veZ.ly/AnS6', '0133842600', 'Uttar Badda, Dhaka, 1212', 'Male', '2021102617021625618652824.jpg', NULL, NULL, NULL, 'profile-photos/PALegGAXN0XYy2FZvpejVYIexUIWFehRmXkw3LIE.jpg', NULL, '2021-10-27 15:59:14');
INSERT INTO `users` VALUES (2, 'User', 'Nokibul Alam Chowdhury', 'nokibaust@gmail.com', NULL, '$2y$10$SrryrxUJfpTrBBxEXEzlLO1LBYFpaTZoV8eTL3B8WlmfxMJmYbVi6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile-photos/PALegGAXN0XYy2FZvpejVYIexUIWFehRmXkw3LIE.jpg', NULL, '2021-10-22 18:03:41');
INSERT INTO `users` VALUES (4, 'User', 'Ashik Chowdhury', 'ashikbracuasddd@gmail.com', NULL, '$2y$10$1tDkde6lUQsBwvedtpbl1uZExHHYs2eAWGSjpOZ8TizTSk42jGqzi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-22 06:38:37', '2021-10-22 06:38:37');

SET FOREIGN_KEY_CHECKS = 1;
