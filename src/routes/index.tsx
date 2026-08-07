import { createFileRoute } from "@tanstack/react-router";
import { useEffect } from "react";

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "Kho tài liệu số — Văn phòng Đảng ủy xã Bà Nà" },
      {
        name: "description",
        content:
          "Kho tài liệu số của Văn phòng Đảng ủy xã Bà Nà: tài liệu chuyển đổi số, tài liệu họp/hội nghị và nghiệp vụ Văn phòng — xem trực tuyến và tải xuống.",
      },
      { property: "og:title", content: "Kho tài liệu số — Văn phòng Đảng ủy xã Bà Nà" },
      {
        property: "og:description",
        content:
          "Tra cứu, xem trực tuyến và tải xuống tài liệu chuyển đổi số, họp/hội nghị, nghiệp vụ Văn phòng.",
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
