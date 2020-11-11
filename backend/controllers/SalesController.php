<?php

namespace backend\controllers;

use backend\models\Login;
use Yii;
use backend\models\Sales;
use backend\models\SalesSearch;
use backend\models\Userrole;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * SalesController implements the CRUD actions for Sales model.
 */
class SalesController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Sales models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SalesSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Sales model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Sales model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Sales();

        if ($model->load(Yii::$app->request->post())) {
            $login = new Login();
            $login->username = $model->nama_sales . $model->telp;
            $login->password = 123;
            $login->nama = $model->nama_sales;
            $login->save(false);
            // var_dump($login->password);

            $hakakses = new Userrole();
            $hakakses->id_system_role = 23;
            $hakakses->id_login = $login->id_login;
            $hakakses->save(false);

            $model->save();
            // die;
            return $this->redirect(['view', 'id' => $model->id_sales]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Sales model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $cek_login = Login::find()->where(['username' => $model->nama_sales . $model->telp])->one();

        if ($model->load(Yii::$app->request->post())) {
            if (!empty($cek_login)) {
                $cek_login->username = $model->nama_sales . $model->telp;
                $cek_login->nama = $model->nama_sales;
                $cek_login->save(false);
            } else {
                $login = new Login();
                $login->username = $model->nama_sales . $model->telp;
                $login->password = 123;
                $login->nama = $model->nama_sales;
                $login->save(false);

                $hakakses = new Userrole();
                $hakakses->id_system_role = 23;
                $hakakses->id_login = $login->id_login;
                $hakakses->save(false);
            }

            $model->save();
            return $this->redirect(['view', 'id' => $model->id_sales]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Sales model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Sales model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Sales the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Sales::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
