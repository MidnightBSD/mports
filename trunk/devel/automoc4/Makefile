# $MidnightBSD$

PORTNAME=	automoc4
PORTVERSION=	0.9.88
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTNAME}/${PORTVERSION}/
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatic moc for Qt 4 packages
LICENSE=	bsd2

USE_QT4=	corelib moc qmake_build rcc_build uic_build
USES=		cmake iconv tar:bzip2
MAKE_JOBS_UNSAFE=	yes

.include <bsd.port.mk>
