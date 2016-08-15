# Created by: NAKATA Maho <maho@FreeBSD.org>
# $FreeBSD: head/devel/epm/Makefile 386312 2015-05-14 10:15:04Z mat $
# $MidnightBSD$

PORTNAME=	epm
PORTVERSION=	4.2
CATEGORIES=	devel
MASTER_SITES=	http://www.msweet.org/files/project2/
EXTRACT_SUFX=	-source.tar.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free UNIX software/file packaging program

LICENSE=	gpl2

OPTIONS_DEFINE=	DOCS

MAKE_JOBS_UNSAFE=	yes
USES=		tar:bzip2
GNU_CONFIGURE=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/bin/mkepmlist

.include <bsd.port.mk>
