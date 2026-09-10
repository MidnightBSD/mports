PORTNAME=	ibus-array
PORTVERSION=	0.3.2
CATEGORIES=	chinese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Array 30 input method for IBus
WWW=		https://github.com/lexical/ibus-array/

LICENSE=	gpl2

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>=0:databases/py-sqlite3@${PY_FLAVOR} \
		ibus-daemon:textproc/ibus \
		zh-opencc>=1.0:chinese/opencc
RUN_DEPENDS=	ibus-daemon:textproc/ibus zh-opencc>=1.0:chinese/opencc

USES=		gettext-tools gnome meson pkgconfig python sqlite
USE_GNOME+=	glib20
USE_GITHUB=	yes
GH_ACCOUNT=	lexical
GH_TAGNAME=	release-${PORTVERSION}

BINARY_ALIAS=	python3=${PYTHON_CMD}

post-patch:
	@${REINPLACE_CMD} -e "s|cur.execute('INSERT INTO main.*|cur.execute('INSERT INTO main (keys, ch, cat, cnt) VALUES (?, ?, ?, ?);', (r[1], r[2], r[0], '0'))|" \
		${WRKSRC}/data/cin2sqlite.py

.include <bsd.port.mk>
