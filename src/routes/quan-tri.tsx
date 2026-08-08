import { createFileRoute, redirect } from "@tanstack/react-router";

export const Route = createFileRoute("/quan-tri")({
  beforeLoad: () => {
    throw redirect({ href: "/flipbook.html?admin=1" });
  },
  component: () => null,
});
