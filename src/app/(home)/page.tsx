import Link from 'next/link';
import {
  ArrowRight,
  Terminal,
  Cpu,
  Network,
  Database,
  Layers,
  Zap,
} from 'lucide-react';

export default function HomePage() {
  return (
    <div className="min-h-[calc(100vh-4rem)]">
      {/* Hero */}
      <section className="relative px-6 pt-20 pb-24 overflow-hidden">
        {/* Background */}
        <div className="absolute inset-0 hero-grid" />
        <div className="hero-glow" />

        <div className="relative max-w-5xl mx-auto">
          <div className="grid lg:grid-cols-2 gap-16 items-center">
            {/* Left: Text */}
            <div className="animate-fade-up">
              <div className="inline-flex items-center gap-2 px-3 py-1.5 mb-6 text-xs font-medium rounded border border-[hsl(0_0%_18%)] text-[hsl(0_0%_50%)]">
                <span className="w-1.5 h-1.5 rounded-full bg-[hsl(45_70%_55%)]" />
                v0.1 — Internal Build
              </div>

              <h1 className="text-4xl md:text-5xl font-semibold tracking-tight mb-4 text-[hsl(0_0%_92%)]">
                MAEngine
              </h1>

              <p className="text-lg text-[hsl(0_0%_50%)] mb-8 leading-relaxed max-w-md">
                Multiplayer game server toolkit. Rust core with Lua scripting,
                QUIC transport, and Unreal Engine 5 client integration.
              </p>

              <div className="flex flex-wrap gap-3">
                <Link href="/docs" className="btn-primary">
                  Documentation
                  <ArrowRight className="w-4 h-4" />
                </Link>
                <Link href="/docs/scripting" className="btn-secondary">
                  <Terminal className="w-4 h-4" />
                  API Reference
                </Link>
              </div>
            </div>

            {/* Right: Code Window */}
            <div className="animate-fade-up delay-200">
              <CodeWindow />
            </div>
          </div>
        </div>
      </section>

      {/* Divider */}
      <div className="divider" />

      {/* Features */}
      <section className="px-6 py-20">
        <div className="max-w-5xl mx-auto">
          <div className="grid lg:grid-cols-2 gap-16">
            {/* Left: Feature List */}
            <div className="animate-fade-up delay-100">
              <h2 className="text-xs font-medium uppercase tracking-wider text-[hsl(0_0%_40%)] mb-8">
                Architecture
              </h2>

              <div className="space-y-0">
                <FeatureItem
                  icon={<Cpu />}
                  label="Rust Core"
                  desc="High-performance networking and ECS with Bevy"
                />
                <FeatureItem
                  icon={<Terminal />}
                  label="Lua Scripting"
                  desc="LuaJIT (server) and Lua 5.4 (client) runtimes"
                />
                <FeatureItem
                  icon={<Network />}
                  label="QUIC Transport"
                  desc="Modern UDP transport with TLS 1.3 encryption"
                />
                <FeatureItem
                  icon={<Database />}
                  label="SurrealDB"
                  desc="Embedded database with graph relations"
                />
                <FeatureItem
                  icon={<Layers />}
                  label="Unreal Engine 5"
                  desc="Client integration with WebUI overlay"
                />
                <FeatureItem
                  icon={<Zap />}
                  label="Server Authoritative"
                  desc="Secure architecture with validation tiers"
                />
              </div>
            </div>

            {/* Right: Quick Links */}
            <div className="animate-fade-up delay-300">
              <h2 className="text-xs font-medium uppercase tracking-wider text-[hsl(0_0%_40%)] mb-8">
                Quick Access
              </h2>

              <div className="grid gap-3">
                <QuickLink href="/docs/scripting/server" label="Server API" tag="server" />
                <QuickLink href="/docs/scripting/client" label="Client API" tag="client" />
                <QuickLink href="/docs/scripting/events" label="Events System" tag="both" />
                <QuickLink href="/docs/scripting/entities" label="Entity Classes" tag="both" />
                <QuickLink href="/docs/scripting/database" label="Database" tag="server" />
                <QuickLink href="/docs/scripting/webui" label="WebUI" tag="client" />
              </div>

              <div className="mt-8 pt-8 border-t border-[hsl(0_0%_12%)]">
                <Link href="/docs/roadmap" className="link-arrow">
                  View Roadmap
                  <ArrowRight className="w-3.5 h-3.5" />
                </Link>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="px-6 py-6 border-t border-[hsl(0_0%_10%)]">
        <div className="max-w-5xl mx-auto text-center">
          <div className="text-xs text-[hsl(0_0%_35%)]">
            <span className="text-[hsl(0_0%_50%)] font-medium">MAEngine</span>
            {' · '}Internal Documentation
          </div>
        </div>
      </footer>
    </div>
  );
}

function CodeWindow() {
  return (
    <div className="code-window font-mono-display">
      <div className="code-window-header">
        <div className="code-window-dot" />
        <div className="code-window-dot" />
        <div className="code-window-dot" />
        <span className="code-window-title">Server/init.lua</span>
      </div>
      <div className="code-window-body">
        <pre className="!bg-transparent !border-0 !p-0 !m-0">
          <code>
            <Line><span className="syn-comment">-- Game server entry point</span></Line>
            <Line />
            <Line>
              <span className="syn-variable">Server</span>
              <span className="text-[hsl(225_10%_50%)]">.</span>
              <span className="syn-function">Subscribe</span>
              <span className="text-[hsl(225_10%_50%)]">(</span>
              <span className="syn-string">"Start"</span>
              <span className="text-[hsl(225_10%_50%)]">, </span>
              <span className="syn-keyword">function</span>
              <span className="text-[hsl(225_10%_50%)]">()</span>
            </Line>
            <Line>
              <span className="text-[hsl(225_10%_50%)]">{'    '}</span>
              <span className="syn-function">Log</span>
              <span className="text-[hsl(225_10%_50%)]">(</span>
              <span className="syn-string">"Server started"</span>
              <span className="text-[hsl(225_10%_50%)]">)</span>
            </Line>
            <Line>
              <span className="syn-keyword">end</span>
              <span className="text-[hsl(225_10%_50%)]">)</span>
            </Line>
            <Line />
            <Line>
              <span className="syn-variable">Player</span>
              <span className="text-[hsl(225_10%_50%)]">.</span>
              <span className="syn-function">Subscribe</span>
              <span className="text-[hsl(225_10%_50%)]">(</span>
              <span className="syn-string">"Spawn"</span>
              <span className="text-[hsl(225_10%_50%)]">, </span>
              <span className="syn-keyword">function</span>
              <span className="text-[hsl(225_10%_50%)]">(</span>
              <span className="syn-variable">player</span>
              <span className="text-[hsl(225_10%_50%)]">)</span>
            </Line>
            <Line>
              <span className="text-[hsl(225_10%_50%)]">{'    '}</span>
              <span className="syn-keyword">local</span>
              <span className="text-[hsl(225_10%_50%)]"> char = </span>
              <span className="syn-variable">Character</span>
              <span className="text-[hsl(225_10%_50%)]">.</span>
              <span className="syn-function">Spawn</span>
              <span className="text-[hsl(225_10%_50%)]">(</span>
              <span className="syn-function">Vec3</span>
              <span className="text-[hsl(225_10%_50%)]">(</span>
              <span className="syn-number">0</span>
              <span className="text-[hsl(225_10%_50%)]">, </span>
              <span className="syn-number">0</span>
              <span className="text-[hsl(225_10%_50%)]">, </span>
              <span className="syn-number">100</span>
              <span className="text-[hsl(225_10%_50%)]">))</span>
            </Line>
            <Line>
              <span className="text-[hsl(225_10%_50%)]">{'    '}</span>
              <span className="syn-variable">player</span>
              <span className="text-[hsl(225_10%_50%)]">:</span>
              <span className="syn-function">Possess</span>
              <span className="text-[hsl(225_10%_50%)]">(char)</span>
            </Line>
            <Line>
              <span className="syn-keyword">end</span>
              <span className="text-[hsl(225_10%_50%)]">)</span>
            </Line>
          </code>
        </pre>
      </div>
    </div>
  );
}

function Line({ children }: { children?: React.ReactNode }) {
  return <div className="min-h-[1.7em]">{children}</div>;
}

function FeatureItem({
  icon,
  label,
  desc,
}: {
  icon: React.ReactNode;
  label: string;
  desc: string;
}) {
  return (
    <div className="feature-item">
      <div className="feature-icon">{icon}</div>
      <div>
        <div className="feature-label">{label}</div>
        <div className="feature-desc">{desc}</div>
      </div>
    </div>
  );
}

function QuickLink({
  href,
  label,
  tag,
}: {
  href: string;
  label: string;
  tag: 'server' | 'client' | 'both';
}) {
  const tagColors = {
    server: 'bg-[hsl(30_30%_45%/0.12)] text-[hsl(30_25%_55%)]',
    client: 'bg-[hsl(210_25%_50%/0.12)] text-[hsl(210_20%_60%)]',
    both: 'bg-[hsl(0_0%_50%/0.1)] text-[hsl(0_0%_55%)]',
  };

  return (
    <Link
      href={href}
      className="group flex items-center justify-between p-4 rounded-lg border border-[hsl(0_0%_12%)] bg-[hsl(0_0%_6%)] hover:border-[hsl(0_0%_18%)] hover:bg-[hsl(0_0%_8%)] transition-all"
    >
      <span className="text-sm font-medium text-[hsl(0_0%_70%)] group-hover:text-[hsl(0_0%_90%)] transition-colors">
        {label}
      </span>
      <div className="flex items-center gap-3">
        <span className={`text-[10px] font-medium uppercase tracking-wider px-2 py-0.5 rounded ${tagColors[tag]}`}>
          {tag}
        </span>
        <ArrowRight className="w-4 h-4 text-[hsl(0_0%_30%)] group-hover:text-[hsl(0_0%_50%)] group-hover:translate-x-0.5 transition-all" />
      </div>
    </Link>
  );
}
