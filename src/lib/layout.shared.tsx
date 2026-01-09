import type { BaseLayoutProps } from 'fumadocs-ui/layouts/shared';

export function baseOptions(): BaseLayoutProps {
  return {
    nav: {
      title: (
        <span className="font-semibold text-[hsl(225_10%_85%)] tracking-tight">
          MAEngine
        </span>
      ),
    },
    links: [],
  };
}
