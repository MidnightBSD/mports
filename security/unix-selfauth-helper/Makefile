PORTNAME=	unix-selfauth-helper
DISTVERSION=	1.1
DISTVERSIONPREFIX=	v
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Local self-authentication for pam_exec
WWW=		https://github.com/Zirias/unix-selfauth-helper

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

MAKE_ARGS+=	MANDIR=${PREFIX}/share/man/man

USES=		tar:xz uidfix

USE_GITHUB=	yes
GH_ACCOUNT=	Zirias

.include <bsd.port.mk>
