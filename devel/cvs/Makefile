PORTNAME=	cvs
PORTVERSION=	1.20120905
PORTREVISION=	7
CATEGORIES=	devel
MASTER_SITES=	FREEBSD_LOCAL/eadler

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Version control system

LICENSE=	gpl2+

CONFLICTS_INSTALL?=	cvs+ipv6-[12]* cvs-devel-[12]*

OPTIONS_DEFINE=	IPV6 KERBEROS EXAMPLES
OPTIONS_DEFAULT=KERBEROS
.if !make(makesum)
OPTIONS_EXCLUDE?=IPV6
.endif

IPV6_CATEGORIES=	ipv6
IPV6_PATCH_SITES=	FREEBSD_LOCAL/ume
IPV6_PATCHFILES=	${DISTNAME}-v6-20140105.diff.gz:-p1
KERBEROS_MAKE_ARGS=	KERBEROS_SUPPORT=yes

USES=		cpe makeinfo shebangfix tar:xz uidfix
CPE_VENDOR=	gnu
SHEBANG_FILES=	contrib/clmerge contrib/cln_hist \
		contrib/commit_prep contrib/cvs_acls \
		contrib/easy-import contrib/log \
		contrib/log_accum contrib/mfpipe \
		contrib/rcslock
PATCH_WRKSRC=	${WRKDIR}/call/cvs
WRKSRC=		${WRKDIR}/call/cvs-build

DESTDIRNAME=	NADA
MAKE_ARGS=	DESTDIR=${FAKE_DESTDIR}${TRUE_PREFIX}
MAKE_ARGS+=	WITHOUT_PIE=true
MAKE_ARGS+=	MANDIR=/share/man/man

pre-install:
	${MKDIR} ${PREFIX}/info
	@${MKDIR} ${EXAMPLESDIR}/contrib

.include <bsd.port.mk>
