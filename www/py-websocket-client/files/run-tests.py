import asyncio
import os
import sys

import websockets


async def echo(connection):
    async for message in connection:
        await connection.send(message)


async def main():
    async with websockets.serve(echo, "127.0.0.1", 0) as server:
        env = os.environ.copy()
        cache_home = env.get("XDG_CACHE_HOME") or env["HOME"]
        os.makedirs(cache_home, exist_ok=True)
        env.setdefault("COVERAGE_FILE", os.path.join(cache_home, "websocket.coverage"))
        env["LOCAL_WS_SERVER_PORT"] = str(server.sockets[0].getsockname()[1])
        process = await asyncio.create_subprocess_exec(
            sys.executable,
            "-m",
            "pytest",
            "-rs",
            "-v",
            "--import-mode=importlib",
            "-o",
            "cache_dir=" + os.path.join(cache_home, "websocket-pytest"),
            "websocket/tests",
            *sys.argv[1:],
            env=env,
        )
        return await process.wait()


raise SystemExit(asyncio.run(main()))
