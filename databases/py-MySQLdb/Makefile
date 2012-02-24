# $MidnightBSD: mports/databases/py-MySQLdb/Makefile,v 1.2 2009/10/14 00:20:50 laffer1 Exp $

PORTNAME=	MySQLdb
DISTVERSION=	1.2.3
CATEGORIES=	databases python
MASTER_SITES=	SF/mysql-python/mysql-python/${PORTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	MySQL-python-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Access a MySQL database through Python
LICENSE=	gpl2

USE_PYTHON=		-2.7
USE_PYDISTUTILS=	easy_install
USE_MYSQL=		yes
PYDISTUTILS_PKGNAME=	MySQL-python
PYEASYINSTALL_ARCHDEP=	yes

CONFLICTS=	py*-MySQLdb-devel-[0-9]*

PORTDOCS=	*

OPTIONSFILE=	${PORT_DBDIR}/${PORTNAME}/options
OPTIONS=	MYSQLCLIENT_R "Use libmysqlclient_r (thread safe)" on

.include <bsd.port.pre.mk>

pre-configure:
.if defined(WITHOUT_MYSQLCLIENT_R)
	@${REINPLACE_CMD} -E -e "s|(threadsafe.*)True|\1 False|" \
		${WRKSRC}/site.cfg
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/* ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
