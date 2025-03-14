<?php
class Login extends Db
{
    // Phương thức đăng nhập người dùng
    public function loginUser($email, $password)
    {
        try {
            $query = "SELECT * FROM users WHERE email = ?";
            $stmt = self::$connection->prepare($query);
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();

                if (password_verify($password, $row['password'])) {
                    return [
                        'status' => true,
                        'user' => $row
                    ];
                }
            }

            return [
                'status' => false,
                'message' => 'Email hoặc mật khẩu không đúng!'
            ];
        } catch (Exception $e) {
            return [
                'status' => false,
                'message' => 'Login failed: ' . $e->getMessage()
            ];
        }
    }

    // Phương thức lưu remember token
    public function setRememberToken($userId, $token, $expires)
    {
        try {
            $query = "UPDATE users SET remember_token = ?, token_expires = ? WHERE id = ?";
            $stmt = self::$connection->prepare($query);
            $stmt->bind_param("ssi", $token, $expires, $userId);
            return $stmt->execute();
        } catch (Exception $e) {
            return false;
        }
    }

    // Phương thức lấy người dùng theo email
    public function getUserByEmail($email)
    {
        try {
            $query = "SELECT * FROM users WHERE email = ?";
            $stmt = self::$connection->prepare($query);
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();
            return $result->fetch_assoc();
        } catch (Exception $e) {
            return false;
        }
    }

    // Phương thức cập nhật token thay đổi mật khẩu
    public function setPasswordResetToken($userId, $token, $expires)
    {
        try {
            $query = "UPDATE users SET reset_token = ?, reset_token_expires = ? WHERE id = ?";
            $stmt = self::$connection->prepare($query);
            $stmt->bind_param("ssi", $token, $expires, $userId);
            return $stmt->execute();
        } catch (Exception $e) {
            return false;
        }
    }

    // Phương thức lấy người dùng theo token reset mật khẩu
    public function getUserByToken($token)
    {
        try {
            $query = "SELECT * FROM users WHERE reset_token = ?";
            $stmt = self::$connection->prepare($query);
            $stmt->bind_param("s", $token);
            $stmt->execute();
            $result = $stmt->get_result();
            return $result->fetch_assoc();
        } catch (Exception $e) {
            return false;
        }
    }

    // Phương thức cập nhật mật khẩu người dùng
    public function updatePassword($userId, $newPassword)
    {
        try {
            $query = "UPDATE users SET password = ? WHERE id = ?";
            $stmt = self::$connection->prepare($query);
            $stmt->bind_param("si", $newPassword, $userId);
            return $stmt->execute();
        } catch (Exception $e) {
            return false;
        }
    }

    // Phương thức xóa token reset mật khẩu sau khi cập nhật mật khẩu thành công
    public function deletePasswordResetToken($userId)
    {
        try {
            $query = "UPDATE users SET reset_token = NULL, reset_token_expires = NULL WHERE id = ?";
            $stmt = self::$connection->prepare($query);
            $stmt->bind_param("i", $userId);
            return $stmt->execute();
        } catch (Exception $e) {
            return false;
        }
    }
}
?>
