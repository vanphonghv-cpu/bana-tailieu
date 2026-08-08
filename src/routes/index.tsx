import { createFileRoute, redirect } from "@tanstack/react-router";

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
  beforeLoad: () => {
    throw redirect({ href: "/flipbook.html" });
  },
  component: () => null,
});

