PORTNAME=	weechat-otr
DISTVERSIONPREFIX=	v
DISTVERSION=	1.9.2
PORTREVISION=	1
CATEGORIES=	irc security python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WeeChat script for Off-the-Record (OTR) messaging
WWW=		https://github.com/mmb/weechat-otr

LICENSE=	gpl3

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}potr>=1.0.1:security/py-potr@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}potr>=1.0.1:security/py-potr@${PY_FLAVOR} \
		weechat:irc/weechat

USES=		python
USE_GITHUB=	yes
GH_ACCOUNT=	mmb

NO_BUILD=	yes

PLIST_FILES=	${PYTHON_SITELIBDIR}/weechat/weechat_otr.py

do-install:
	${MKDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/weechat
	${INSTALL_DATA} ${WRKSRC}/weechat_otr.py \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/weechat/weechat_otr.py

.include <bsd.port.mk>
