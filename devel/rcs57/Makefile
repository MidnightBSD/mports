PORTNAME=	rcs
PORTVERSION=	5.7
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	GNU
PKGNAMESUFFIX=	57

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Version control system (as was in FreeBSD prior to removal)
WWW=		https://www.gnu.org/software/rcs/

LICENSE=	gpl2

OPTIONS_DEFINE=	FREEBSD
OPTIONS_DEFAULT=	FREEBSD
FREEBSD_DESC=	Apply FreeBSD patches

CONFLICTS=	rcs

USES=		autoreconf desthack gmake
USE_CSTD=	gnu89
GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=	yes


FREEBSD_EXTRA_PATCHES+=	${FILESDIR}/freebsd-src-ident.c \
		${FILESDIR}/freebsd-src-maketime.c \
		${FILESDIR}/freebsd-src-rcsbase.h \
		${FILESDIR}/freebsd-src-rcsedit.c \
		${FILESDIR}/freebsd-src-rcsfnms.c \
		${FILESDIR}/freebsd-src-rcskeep.c \
		${FILESDIR}/freebsd-src-rcskeys.c \
		${FILESDIR}/freebsd-src-rcsrev.c \
		${FILESDIR}/freebsd-src-rcsutil.c \
		${FILESDIR}/freebsd-src-rcsdiff.c \
		${FILESDIR}/freebsd-src-rlog.c

.include <bsd.port.mk>
