'use client';

import { use, useEffect, useId, useState } from 'react';
import { useTheme } from 'next-themes';

export function Mermaid({ chart }: { chart: string }) {
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);

  if (!mounted) return null;
  return <MermaidContent chart={chart} />;
}

const cache = new Map<string, Promise<unknown>>();

function cachePromise<T>(
  key: string,
  setPromise: () => Promise<T>,
): Promise<T> {
  const cached = cache.get(key);
  if (cached) return cached as Promise<T>;

  const promise = setPromise();
  cache.set(key, promise);
  return promise;
}

function MermaidContent({ chart }: { chart: string }) {
  const id = useId().replace(/:/g, '-');
  const { resolvedTheme } = useTheme();
  const { default: mermaid } = use(
    cachePromise('mermaid', () => import('mermaid')),
  );

  const isDark = resolvedTheme === 'dark';

  mermaid.initialize({
    startOnLoad: false,
    securityLevel: 'loose',
    fontFamily: 'var(--font-geist), system-ui, sans-serif',
    theme: 'base',
    themeVariables: isDark ? {
      // Dark theme - neutral with yellow/amber accent
      background: 'transparent',
      primaryColor: '#292524',
      primaryTextColor: '#fafaf9',
      primaryBorderColor: '#d97706',
      secondaryColor: '#1c1917',
      secondaryTextColor: '#e7e5e4',
      secondaryBorderColor: '#44403c',
      tertiaryColor: '#0c0a09',
      tertiaryTextColor: '#d6d3d1',
      tertiaryBorderColor: '#292524',
      lineColor: '#78716c',
      textColor: '#e7e5e4',
      mainBkg: '#1c1917',
      nodeBorder: '#d97706',
      clusterBkg: '#0c0a09',
      clusterBorder: '#292524',
      titleColor: '#fafaf9',
      edgeLabelBackground: '#1c1917',
      nodeTextColor: '#fafaf9',
    } : {
      // Light theme - neutral with yellow/amber accent
      background: 'transparent',
      primaryColor: '#fafaf9',
      primaryTextColor: '#1c1917',
      primaryBorderColor: '#d97706',
      secondaryColor: '#f5f5f4',
      secondaryTextColor: '#292524',
      secondaryBorderColor: '#d6d3d1',
      tertiaryColor: '#e7e5e4',
      lineColor: '#a8a29e',
      textColor: '#292524',
      mainBkg: '#fafaf9',
      nodeBorder: '#d97706',
      clusterBkg: '#f5f5f4',
      clusterBorder: '#e7e5e4',
      titleColor: '#1c1917',
      edgeLabelBackground: '#fafaf9',
      nodeTextColor: '#1c1917',
    },
  });

  const { svg, bindFunctions } = use(
    cachePromise(`${chart}-${resolvedTheme}`, () => {
      return mermaid.render(`mermaid-${id}`, chart);
    }),
  );

  return (
    <div
      className="my-6 flex justify-center overflow-x-auto rounded-lg border border-fd-border bg-fd-card/30 p-6"
      ref={(container) => {
        if (container) bindFunctions?.(container);
      }}
      dangerouslySetInnerHTML={{ __html: svg }}
    />
  );
}
