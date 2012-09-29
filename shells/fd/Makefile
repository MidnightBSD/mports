# $MidnightBSD: mports/shells/fd/Makefile,v 1.4 2009/12/28 20:18:08 laffer1 Exp $

PORTNAME=	fd
PORTVERSION=	3.00k
CATEGORIES=	shells net
MASTER_SITES=	http://hp.vector.co.jp/authors/VA012337/soft/fd/ \
		ftp://ftp.unixusers.net/src/fdclone/
DISTNAME=	FD-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A CUI-based file and directory management tool
LICENSE=	other

MAKE_JOBS_SAFE=	yes

MANLANG=	"" ja
MAN1=		fd.1 fdsh.1
MAKE_ENV=	LANG=ja
MAKE_ARGS=	CC="${CC}" CONFDIR="${PREFIX}/etc"

DOCS_EN=	FAQ.eng \
		LICENSES.eng \
		README.eng \
		TECHKNOW.eng \
		ToAdmin.eng
DOCS_JA=	FAQ \
		HISTORY \
		LICENSES \
		README \
		TECHKNOW \
		ToAdmin

post-configure:
	${REINPLACE_CMD} -E -e 's|^(#[[:space:]]*define[[:space:]]+EXTENDCCOPT[[:space:]]+"([^"]+ )?)-O(["[:space:]])|\1${CFLAGS}\3|' ${WRKSRC}/machine.h

post-install:
	@${INSTALL_DATA} ${WRKSRC}/_fdrc.orig ${PREFIX}/etc/fd2rc.dist
	@${INSTALL_DATA} ${WRKSRC}/_fdrc ${PREFIX}/etc/fd2rc.sample
	if [ ! -f ${PREFIX}/etc/fd2rc ]; then \
		${CP} -p ${PREFIX}/etc/fd2rc.sample ${PREFIX}/etc/fd2rc; \
	fi
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${MKDIR} ${PREFIX}/share/doc/ja/${PORTNAME}
	@for i in ${DOCS_EN}; do \
		${INSTALL_DATA} ${WRKSRC}/$$i ${DOCSDIR}; \
	done
	@for i in ${DOCS_JA}; do \
		${INSTALL_DATA} ${WRKSRC}/$$i ${PREFIX}/share/doc/ja/${PORTNAME}; \
	done
.endif

.include <bsd.port.mk>
