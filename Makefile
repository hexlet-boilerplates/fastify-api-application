install:
	npm ci
	mise exec -- hk install --mise

dev:
	npm run dev

start:
	npm start

check-types:
	npm run check-types

format:
	npm run format

format-check:
	npm run format:check

lint:
	rumdl check .
	typos
	jactionlint
	$(MAKE) --no-print-directory knip

# Только отчёт, без --fix: находки решает человек
knip:
	npx knip
