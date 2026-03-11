import type { Template } from "@/types";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE ?? "http://127.0.0.1:8000";

async function request<T>(path: string): Promise<T> {
  const res = await fetch(`${API_BASE}${path}`);
  if (!res.ok) throw new Error(`API error: ${res.status}`);
  return res.json() as Promise<T>;
}

export const api = {
  templates: {
    list: () => request<Template[]>("/api/templates/"),
    get: (id: string) => request<Template>(`/api/templates/${id}`),
  },
};
