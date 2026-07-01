import { createFileRoute } from "@tanstack/react-router";
import { useEffect } from "react";

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "Văn phòng Đảng ủy xã Bà Nà — Tài liệu lật trang" },
      {
        name: "description",
        content:
          "Giá sách số của Văn phòng Đảng ủy xã Bà Nà — đọc tài liệu, sách PDF theo hình thức lật trang trên trình duyệt.",
      },
      { property: "og:title", content: "Văn phòng Đảng ủy xã Bà Nà — Tài liệu lật trang" },
      {
        property: "og:description",
        content: "Giá sách số — đọc tài liệu PDF theo hình thức lật trang.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: Index,
});

function Index() {
  useEffect(() => {
    window.location.replace("/flipbook.html");
  }, []);
  return (
    <div
      style={{
        minHeight: "100vh",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        background: "#1C0E0F",
        color: "#E7CE86",
        fontFamily: "system-ui, sans-serif",
      }}
    >
      Đang mở giá sách…
    </div>
  );
}
