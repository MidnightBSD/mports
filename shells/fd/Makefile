PORTNAME=	fd
PORTVERSION=	3.01j
CATEGORIES=	shells net
MASTER_SITES=	http://hp.vector.co.jp/authors/VA012337/soft/fd/ \
		ftp://ftp.unixusers.net/src/fdclone/
DISTNAME=	FD-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CUI-based file and directory management tool
WWW=		https://hp.vector.co.jp/authors/VA012337/soft/fd/

LICENSE=	other

MAKE_ENV=	LANG=ja
MAKE_ARGS=	CC="${CC}" CONFDIR="${PREFIX}/etc" \
		MANTOP="\$$(DESTDIR)${PREFIX}/share/man"
CONFLICTS_INSTALL=	fd-find # bin/fd

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

OPTIONS_DEFINE=	DOCS

post-configure:
	${REINPLACE_CMD} -E -e 's|^(#[[:space:]]*define[[:space:]]+EXTENDCCOPT[[:space:]]+"([^"]+ )?)-O(["[:space:]])|\1${CFLAGS}\3|' ${WRKSRC}/machine.h

post-install:
	@${INSTALL_DATA} ${WRKSRC}/_fdrc.orig ${PREFIX}/etc/fd2rc.dist
	@${INSTALL_DATA} ${WRKSRC}/_fdrc ${PREFIX}/etc/fd2rc.sample
	if [ ! -f ${PREFIX}/etc/fd2rc ]; then \
		${CP} -p ${PREFIX}/etc/fd2rc.sample ${PREFIX}/etc/fd2rc; \
	fi

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/doc/ja/${PORTNAME}
	@for i in ${DOCS_EN}; do \
		${INSTALL_DATA} ${WRKSRC}/$$i ${FAKE_DESTDIR}${DOCSDIR}; \
	done
	@for i in ${DOCS_JA}; do \
		${INSTALL_DATA} ${WRKSRC}/$$i ${FAKE_DESTDIR}${PREFIX}/share/doc/ja/${PORTNAME}; \
	done

.include <bsd.port.mk>
